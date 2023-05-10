import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'flow_delegate.dart';

class ImageGallery extends StatelessWidget {
  final List<String> images;

  const ImageGallery({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return Container();

    return Column(
      children: images
          .map((e) => ImageCard(
                image: e,
              ))
          .toList(),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String image;
  final GlobalKey _backgroundImageKey = GlobalKey();

  ImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Flow(
                  delegate: ParallaxFlowDelegate(
                    scrollable: Scrollable.of(context),
                    listItemContext: context,
                    backgroundImageKey: _backgroundImageKey,
                  ),
                  children: [
                    CachedNetworkImage(
                      key: _backgroundImageKey,
                      imageUrl: image,
                      fit: BoxFit.cover,
                      placeholder: (ctx, str) => const Center(
                        child: CupertinoActivityIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Positioned.fill(
                    child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.6, 0.95],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}


