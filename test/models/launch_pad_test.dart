import 'package:flutter_test/flutter_test.dart';
import 'package:spacex/model/launch_pad_model.dart';

import '../common.dart';

main() {
  group('launch_pad model test', () {
    test('launch_pad.fromJson', () {
      final launchPad = LaunchPadModel.fromJson(exampleJsonLaunchPad);

      expect(launchPad.id, "5e9e4501f509094ba4566f84");
      expect(launchPad.name, "CCSFS SLC 40");
      expect(launchPad.region, "Florida");
      expect(launchPad.fullName,
          "Cape Canaveral Space Force Station Space Launch Complex 40");
      expect(launchPad.locality, "Cape Canaveral");
      expect(launchPad.latitude, 28.5618571);
      expect(launchPad.longitude, -80.577366);
      expect(launchPad.launchAttempt, 99);
      expect(launchPad.launchSuccess, 97);
      expect(
        launchPad.details,
        "SpaceX's primary Falcon 9 pad, where all east coast Falcon 9s launched prior to the AMOS-6 anomaly. Previously used alongside SLC-41 to launch Titan rockets for the US Air Force, the pad was heavily damaged by the AMOS-6 anomaly in September 2016. It returned to flight with CRS-13 on December 15, 2017, boasting an upgraded throwback-style Transporter-Erector modeled after that at LC-39A.",
      );

      expect(launchPad.images.length, 1);
      expect(launchPad.images[0], "https://i.imgur.com/9oEMXwa.png");
    });
  });
}
