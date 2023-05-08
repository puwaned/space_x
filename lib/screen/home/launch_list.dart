import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/bloc/launch/bloc.dart';
import 'package:spacex/bloc/launch/event.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/model/share_model.dart';
import 'package:spacex/extension/date.dart';

class LaunchList extends StatefulWidget {
  final PaginationModel<LaunchModel> launch;

  const LaunchList({super.key, required this.launch});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LaunchList> {
  PaginationModel<LaunchModel> get launch => widget.launch;

  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
      ..addListener(() {
        var fetchMoreArea = _controller.position.maxScrollExtent;
        if (_controller.position.pixels >= fetchMoreArea &&
            launch.nextPage != null) {
          var launchBloc = context.read<LaunchBloc>();
          launchBloc.add(LoadMoreLaunchEvent(launch.nextPage!, launch.docs));
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var list = launch.docs;

    return AnimatedList(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        initialItemCount: list.length,
        itemBuilder: (context, index, animation) {
          var item = list[index];

          return SlideTransition(
            position: CurvedAnimation(
              curve: Curves.easeOut,
              parent: animation,
            ).drive((Tween<Offset>(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
            ))),
            child: Column(
              children: [
                LaunchRocketCard(
                  item: item,
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          );
        });
  }
}

class LaunchRocketCard extends StatelessWidget {
  final LaunchModel item;

  const LaunchRocketCard({super.key, required this.item});

  _getDotColor(bool? isSuccess) {
    if (isSuccess == null) {
      return Colors.yellow;
    }
    if (isSuccess) {
      return Colors.green;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    var imageList = item.links?.flickr?.original ?? [];
    var coverImage = imageList.isEmpty ? '' : imageList.first;
    var fireDate = item.fireDate != null ? item.fireDate!.format() : '-';

    return Container(
      clipBehavior: Clip.hardEdge,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: coverImage,
            errorWidget: (context, str, _) {
              return Container(
                color: Colors.black26,
                child: const Center(
                  child: Text('No image.'),
                ),
              );
            },
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
              ]))),
          Positioned(
            top: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text(
                      'Launch status : ',
                      style: TextStyle(fontSize: 12),
                    ),
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        height: 11,
                        width: 11,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _getDotColor(item.success)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          // Positioned(
          //     top: 10,
          //     right: 10,
          //     child: ,
          Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Rocket launch date',
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        fireDate,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                // child: Row(
                //   children: [
                //     Expanded(flex: 1, child: ),
                //     Expanded(flex: 1, child: Container()),
                //   ],
                // ),
              ))
        ],
      ),
    );
  }
}
