import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spacex/extension/date.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/presentation/launch/view/launch_list.dart';

import '../common.dart';

main() {
  late LaunchModel launchItem;

  setUpAll(() {
    launchItem = LaunchModel.fromJson(exampleJsonLaunch);
  });

  testWidgets('Display launch rocket card', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        //because of flow animation that make it need scroll parent
        body: SingleChildScrollView(
          child: LaunchRocketCard(
            key: Key(launchItem.id),
            item: launchItem,
          ),
        ),
      ),
    ));

    final cardFinder = find.byType(LaunchRocketCard);
    expect(cardFinder, findsOneWidget);

    final findName = find.text(launchItem.name);
    expect(findName, findsOneWidget);

    final findLaunchDate = find.text(launchItem.fireDate.format());
    expect(findLaunchDate, findsOneWidget);

    final findLaunchStatus = tester
        .firstWidget(find.byKey(const Key('launch_card_status'))) as Container;
    expect((findLaunchStatus.decoration as BoxDecoration).color, Colors.green);
  });
}
