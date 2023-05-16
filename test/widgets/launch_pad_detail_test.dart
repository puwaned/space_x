import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spacex/model/launch_pad_model.dart';
import 'package:spacex/presentation/launch_pad/view/screen.dart';

import '../common.dart';

main() {
  late final LaunchPadModel item;

  setUpAll(() {
    item = LaunchPadModel.fromJson(exampleJsonLaunchPad);
  });

  testWidgets('Display launch pad detail', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: LaunchPadDetail(
          data: item,
        ),
      ),
    ));

    final findName = find.text(item.name);
    expect(findName, findsOneWidget);

    final findFullName = find.text(item.fullName);
    expect(findFullName, findsOneWidget);

    final findDetail = find.text(item.details ?? "");
    expect(findDetail, findsOneWidget);

    final countLaunchAttempts =
        find.text('${item.launchAttempt}', skipOffstage: false);
    expect(
      countLaunchAttempts,
      findsOneWidget,
    );

    final countLaunchSuccess =
        find.text('${item.launchSuccess}', skipOffstage: false);
    expect(
      countLaunchSuccess,
      findsOneWidget,
    );
  });
}
