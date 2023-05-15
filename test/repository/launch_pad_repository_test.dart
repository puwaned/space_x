import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:spacex/environment.dart';
import 'package:spacex/model/launch_pad_model.dart';
import 'package:spacex/repo/launch_pad_repo.dart';

import '../common.dart';

main() {
  late final Dio dio;
  late final DioAdapter adapter;

  setUpAll(() {
    dio = Dio(
      BaseOptions(
          baseUrl: AppEnvironment.baseUrl,
          responseType: ResponseType.json,
          validateStatus: (_) => true),
    );
    adapter = DioAdapter(dio: dio);
  });

  test('launch-pad.get-one.success', () async {
    const id = '5e9e4501f509094ba4566f84';
    const route = '/v4/launchpads/$id';

    adapter.onGet(route, (server) {
      return server.reply(200, exampleJsonLaunchPad,
          delay: const Duration(seconds: 1));
    });

    final service = LaunchPadRepository(dio: dio);
    final expectRes = LaunchPadModel.fromJson(exampleJsonLaunchPad);
    final actualRes = await service.getOne(id);

    expect(actualRes, equals(expectRes));
  });

  test('launch-pad.get-one.error', () async {
    const id = '5e9e4501f509094ba4566f84';
    const route = '/v4/launchpads/$id';
    const errorCode = 500;

    adapter.onGet(route, (server) {
      return server.reply(errorCode, exampleJsonLaunchPad,
          delay: const Duration(seconds: 1));
    });

    final service = LaunchPadRepository(dio: dio);

    expect(() async => await service.getOne(id), throwsA(predicate((e) {
      return e is Exception &&
          e.toString() == 'Exception: failed with status code $errorCode';
    })));
  });
}
