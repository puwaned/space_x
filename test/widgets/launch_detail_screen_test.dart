import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spacex/extension/date.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/presentation/launch_detail/view/screen.dart';

import '../common.dart';

main() {
  late LaunchModel launchItem;

  setUpAll(() {
    launchItem = LaunchModel.fromJson(exampleJsonLaunch);
  });

  testWidgets('Display launch detail screen', (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: LaunchDetailScreen(
        launchDetail: launchItem,
      ),
    ));

    final findCarousel = find.byType(CarouselSlider);
    expect(findCarousel, findsOneWidget);

    final findCarouselItem = widgetTester
            .firstWidget(find.byKey(const Key('launch_detail_carousel_slider')))
        as CarouselSlider;
    expect(findCarouselItem.items?.length, 6);

    final findName = find.text(launchItem.name, skipOffstage: false);
    expect(findName, findsOneWidget);

    final findDescription =
        find.text(launchItem.details ?? "", skipOffstage: false);
    expect(findDescription, findsOneWidget);

    final findLaunchDate =
        find.text(launchItem.fireDate.format(), skipOffstage: false);
    expect(findLaunchDate, findsOneWidget);

    final findLaunchStatus = find.text('Success', skipOffstage: false);
    expect(findLaunchStatus, findsOneWidget);

    final findIsHasLaunchPad =
        find.byKey(const Key('view_launch_pad'), skipOffstage: false);
    expect(findIsHasLaunchPad, findsOneWidget);

    final findIsHasRocket =
        find.byKey(const Key('view_rocket'), skipOffstage: false);
    expect(findIsHasRocket, findsOneWidget);
  });
}
