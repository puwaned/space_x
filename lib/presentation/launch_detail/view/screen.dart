import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/extension/date.dart';
import 'package:spacex/routes/path.dart';

class LaunchDetailScreen extends StatefulWidget {
  const LaunchDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LaunchDetailScreen> {
  _getLaunchStatus(bool? success) {
    if (success == null) return 'Unknown';
    return success ? 'Success' : 'Failed';
  }

  _getLogo(String? url) {
    if (url == null) return Container();

    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: CachedNetworkImage(
            width: 100,
            height: 100,
            placeholder: (context, str) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                ),
              );
            },
            imageUrl: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as LaunchModel;

    return Scaffold(
      backgroundColor: const Color(0xFF01051A),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              toolbarHeight: 60,
              leadingWidth: 60,
              expandedHeight: 400,
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              flexibleSpace: ImageCarousel(
                images: args.links?.flickr?.original ?? [],
                id: args.id,
              )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getLogo(args.links?.patch?.large),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      args.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildTextRecord(label: 'Details', value: args.details),
                  _buildTextRecord(
                      label: 'Rocket launch date',
                      value: args.fireDate?.format()),
                  _buildTextRecord(
                      label: 'Launch status',
                      value: _getLaunchStatus(args.success)),
                  _buildWidgetRecord(
                      label: 'Launch pad',
                      onTap: args.launchPad != null
                          ? () {
                              Navigator.of(context).pushNamed(
                                  AppPaths.launchPadDetail,
                                  arguments: args.launchPad);
                            }
                          : null,
                      unique: 'view_lunch_pad_${args.launchPad}'),
                  _buildWidgetRecord(
                      label: 'Rocket',
                      onTap: args.rocket != null
                          ? () {
                              Navigator.of(context).pushNamed(
                                  AppPaths.rocketDetail,
                                  arguments: args.rocket);
                            }
                          : null),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildTextRecord({
    required String label,
    String? value,
  }) {
    return Column(
      children: [
        Divider(
          color: Colors.white.withOpacity(0.5),
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: Text(label)),
            const SizedBox(
              width: 10,
            ),
            Expanded(flex: 2, child: Text(value ?? '-')),
          ],
        )
      ],
    );
  }

  _buildWidgetRecord(
      {required String label, void Function()? onTap, String? unique}) {
    return Column(
      children: [
        Divider(
          color: Colors.white.withOpacity(0.5),
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: Text(label)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 2,
                child: onTap != null
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            radius: 30,
                            onTap: onTap,
                            child: const Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : const Text('-')),
          ],
        )
      ],
    );
  }
}

class ImageCarousel extends StatelessWidget {
  final List<String> images;
  final String id;

  const ImageCarousel({super.key, required this.images, required this.id});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Hero(
          tag: '${id}_preview_image',
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Colors.black54,
                      Colors.transparent,
                      Colors.transparent,
                    ])),
              ),
              const Center(
                child: DefaultTextStyle(
                    style: TextStyle(), child: Text('No image.')),
              )
            ],
          ));
    }

    return CarouselSlider(
        items: images.asMap().entries.map((e) {
          var index = e.key;
          var value = e.value;

          if (index == 0) {
            return Hero(
              tag: '${id}_preview_image',
              child: CachedNetworkImage(
                  height: double.infinity, fit: BoxFit.cover, imageUrl: value),
            );
          }

          return CachedNetworkImage(
              height: double.infinity, fit: BoxFit.cover, imageUrl: value);
        }).toList(),
        options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 0.9,
            disableCenter: true));
  }
}
