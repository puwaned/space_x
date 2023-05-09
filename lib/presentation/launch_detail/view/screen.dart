import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/extension/date.dart';

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
    if (url == null) return null;
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: CachedNetworkImage(width: 100, imageUrl: url),
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
                  _buildRecord(label: 'Details', value: args.details),
                  _buildRecord(
                      label: 'Rocket launch date',
                      value: args.fireDate?.format()),
                  _buildRecord(
                      label: 'Launch status',
                      value: _getLaunchStatus(args.success))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildRecord({required String label, String? value}) {
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
            SizedBox(
              width: 10,
            ),
            Expanded(flex: 2, child: Text(value ?? '-')),
          ],
        )
      ],
    );
  }
}

class ImageCarousel extends StatelessWidget {
  final List<String> images;

  const ImageCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Stack(
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
            child: Text('No image.'),
          )
        ],
      );
    }

    return CarouselSlider(
        items: images
            .map((e) => CachedNetworkImage(
                height: double.infinity, fit: BoxFit.cover, imageUrl: e))
            .toList(),
        options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 0.9,
            disableCenter: true));
  }
}
