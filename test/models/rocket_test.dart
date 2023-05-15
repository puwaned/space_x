import 'package:flutter_test/flutter_test.dart';
import 'package:spacex/model/rocket_model.dart';

import '../common.dart';

final payloadIds = ['leo', 'gto', 'mars'];
final payloadNames = [
  "Low Earth Orbit",
  "Geosynchronous Transfer Orbit",
  "Mars Orbit",
];
final payloadKgs = [22800.0, 8300.0, 4020.0];
final payloadLbs = [50265.0, 18300.0, 8860.0];

main() {
  test('rocket-model.fromJson', () {
    final rocket = RocketModel.fromJson(exampleJsonRocket);
    final landingLeg = rocket.landingLeg;
    final mass = rocket.mass;
    final height = rocket.height;
    final payload = rocket.payloadWeights;

    expect(rocket.id, "5e9d0d95eda69973a809d1ec");
    expect(rocket.name, "Falcon 9");
    expect(rocket.country, "United States");
    expect(rocket.wikipedia, "https://en.wikipedia.org/wiki/Falcon_9");
    expect(rocket.costPerLaunch, 50000000, reason: 'costPerLaunch');
    expect(rocket.company, "SpaceX");
    expect(rocket.description,
        "Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of satellites and the Dragon spacecraft into orbit.");

    expect(rocket.images.length, 6);
    expect(rocket.images[0],
        "https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg");

    //height
    expect(height.meters, 70.0);
    expect(height.feet, 229.6);

    //mass
    expect(mass.kg, 549054.0);
    expect(mass.lb, 1207920.0);

    //landing leg
    expect(landingLeg.number, 4);
    expect(landingLeg.material, "carbon fiber");

    //payload
    expect(payload.length, 3);
    for (var i = 0; i < payload.length; i++) {
      expect(payload[i].id, payloadIds[i]);
      expect(payload[i].name, payloadNames[i]);
      expect(payload[i].kg, payloadKgs[i]);
      expect(payload[i].lb, payloadLbs[i]);
    }
  });
}
