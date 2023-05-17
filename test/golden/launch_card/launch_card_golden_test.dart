import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/presentation/launch/view/launch_list.dart';

import '../../common.dart';
import '../helper.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late LaunchModel launch;

  setUpAll(() {
    launch = LaunchModel.fromJson(exampleJsonLaunch);
  });

  widgetUnderTest({bool? isSuccess}) {
    var item = launch.copyWith(success: isSuccess);
    return GolderHelper.getMaterialApp(
        child: Scaffold(
      body: SingleChildScrollView(
        child: LaunchRocketCard(
          item: item,
        ),
      ),
    ));
  }

  testGoldens('Launch Card', (tester) async {
    final builder = DeviceBuilder()
      ..addScenario(
          name: 'fire success case',
          widget: widgetUnderTest(isSuccess: true),
          onCreate: (widgetKey) async {
            final findStatus = find.descendant(
                of: find.byKey(widgetKey),
                matching: find.byKey(const Key('launch_card_status')));


            final container = tester.firstWidget(findStatus) as Container;
            expect((container.decoration as BoxDecoration).color, Colors.green);

          })
      ..addScenario(
          name: 'fire failed case',
          widget: widgetUnderTest(isSuccess: false),
          onCreate: (widgetKey) async {
            final findStatus = find.descendant(
                of: find.byKey(widgetKey),
                matching: find.byKey(const Key('launch_card_status')));


            final container = tester.firstWidget(findStatus) as Container;
            expect((container.decoration as BoxDecoration).color, Colors.red);
          })
      ..addScenario(
          name: 'fire unknown case',
          widget: widgetUnderTest(isSuccess: null),
          onCreate: (widgetKey) async {
            final findStatus = find.descendant(
                of: find.byKey(widgetKey),
                matching: find.byKey(const Key('launch_card_status')));


            final container = tester.firstWidget(findStatus) as Container;
            expect((container.decoration as BoxDecoration).color, Colors.yellow);
          });

    mockNetworkImagesFor(() async => await tester.pumpDeviceBuilder(builder));
    await screenMatchesGolden(tester, 'launch_card');
  });
}
