import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spacex/model/rocket_model.dart';
import 'package:spacex/presentation/rocket/view/screen.dart';

import '../common.dart';

main() {
  late final RocketModel item;

  setUpAll(() {
    item = RocketModel.fromJson(exampleJsonRocket);
  });

  testWidgets('Display rocket detail', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: RocketDetail(
          data: item,
        ),
      ),
    ));

    final findName = find.text(item.name);
    expect(findName, findsOneWidget);

    final findCountry = find.text(item.country);
    expect(findCountry, findsOneWidget);

    final findHeight = find.text('${item.height.meters} m');
    expect(findHeight, findsOneWidget);

    final findMass = find.text('${item.mass.kg} kg');
    expect(findMass, findsOneWidget);

    final findLegs = find.text('${item.landingLeg.number}');
    expect(findLegs, findsOneWidget);

    for (final payload in item.payloadWeights) {
      final findPayload = find.text(payload.name);
      expect(findPayload, findsOneWidget);
    }
  });
}
