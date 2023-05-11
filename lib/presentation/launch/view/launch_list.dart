import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/presentation/launch/bloc/bloc.dart';
import 'package:spacex/presentation/launch/bloc/event.dart';
import 'package:spacex/presentation/launch/cubit/cubit.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/model/share_model.dart';
import 'package:spacex/extension/date.dart';
import 'package:spacex/presentation/shared/flow_delegate.dart';
import 'package:spacex/routes/path.dart';

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
    _initController();
  }

  _initController() {
    var launchBloc = context.read<LaunchBloc>();
    var launchCubit = context.read<LaunchCubit>();
    _controller = ScrollController()
      ..addListener(() {
        var fetchMoreArea = _controller.position.maxScrollExtent;
        if (_controller.position.pixels >= fetchMoreArea &&
            launch.nextPage != null) {
          var filter = LaunchFilter(
              page: launchCubit.state.page + 1,
              search: launchCubit.state.search,
              sortName: launchCubit.state.sortName,
              sortFireDate: launchCubit.state.sortFireDate);
          launchBloc.add(LoadMoreLaunchEvent(filter, launch.docs));
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

    return ListView.separated(
        key: const Key('launch_list_view'),
        controller: _controller,
        itemBuilder: (context, index) {
          var item = list[index];
          if (index == list.length - 1 && launch.nextPage != null) {
            return Column(
              children: [
                LaunchRocketCard(
                  item: item,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CupertinoActivityIndicator(
                    key: Key('launch_list_view_load_more'),
                    radius: 16,
                    color: Colors.white,
                  ),
                )
              ],
            );
          }

          return LaunchRocketCard(
            key: const Key('launch_rocket_card'),
            item: item,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: list.length);
    // return AnimatedList(
    //     controller: _controller,
    //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //     initialItemCount: list.length,
    //     itemBuilder: (context, index, animation) {
    //       var item = list[index];
    //
    //       return SlideTransition(
    //         position: CurvedAnimation(
    //           curve: Curves.easeOut,
    //           parent: animation,
    //         ).drive((Tween<Offset>(
    //           begin: const Offset(1, 0),
    //           end: const Offset(0, 0),
    //         ))),
    //         child: Column(
    //           children: [
    //             LaunchRocketCard(
    //               item: item,
    //             ),
    //             const SizedBox(
    //               height: 10,
    //             )
    //           ],
    //         ),
    //       );
    //     });
  }
}

class LaunchRocketCard extends StatelessWidget {
  final LaunchModel item;
  final GlobalKey _backgroundImageKey = GlobalKey();

  LaunchRocketCard({super.key, required this.item});

  _getDotColor(bool? isSuccess) {
    if (isSuccess == null) {
      return Colors.yellow;
    }
    if (isSuccess) {
      return Colors.green;
    }
    return Colors.red;
  }

  _getImagePreview(List<String> images, BuildContext context) {
    if (images.isEmpty) {
      return Container(
        color: Colors.black26,
        child: const Center(
          child: DefaultTextStyle(style: TextStyle(), child: Text('No image.')),
        ),
      );
    }

    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        CachedNetworkImage(
          key: _backgroundImageKey,
          fit: BoxFit.fill,
          imageUrl: images.first,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var imageList = item.links?.flickr?.original ?? [];
    var fireDate = item.fireDate != null ? item.fireDate!.format() : '-';

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppPaths.launchDetail, arguments: item);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: '${item.id}_preview_image',
              child: _getImagePreview(imageList, context),
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
      ),
    );
  }
}
