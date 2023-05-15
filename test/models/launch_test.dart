import 'package:flutter_test/flutter_test.dart';
import 'package:spacex/model/launch_model.dart';

import '../common.dart';

main() {
  test('launch-model.fromJson', () {
    final launch = LaunchModel.fromJson(exampleJsonLaunch);
    final patch = launch.links!.patch!;
    final flickr = launch.links!.flickr!;
    final webcast = launch.links!.webcast;

    expect(launch.id, "5eb87ceaffd86e000604b33e");
    expect(
      launch.details,
      "The launch was Boeing's first-ever conjoined launch of a lighter-weight dual-commsat stack that was specifically designed to take advantage of the lower-cost SpaceX Falcon 9 launch vehicle. Per satellite, launch costs were less than \$30 million. The ABS satellite reached its final destination ahead of schedule and started operations on September 10.",
    );
    expect(launch.success, true);
    expect(launch.name, "ABS-3A / Eutelsat 115W B");
    expect(launch.fireDate,
        DateTime.parse('2015-02-25T19:10:00.000Z').toLocal());
    expect(launch.rocket, '5e9d0d95eda69973a809d1ec');
    expect(launch.launchPad, "5e9e4501f509094ba4566f84");

    //patch
    expect(patch.small, "https://images2.imgbox.com/2b/65/8Hd65fHz_o.png");
    expect(patch.large, "https://images2.imgbox.com/3f/c9/ZczpJ97M_o.png");

    //flickr
    expect(flickr.small.isEmpty, true);
    expect(flickr.original.isNotEmpty, true);
    expect(flickr.original.length, 6);

    //webcast
    expect(webcast, "https://www.youtube.com/watch?v=mN7lyaCBzT8");
  });
}
