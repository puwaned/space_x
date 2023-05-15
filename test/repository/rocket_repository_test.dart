import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spacex/environment.dart';
import 'package:spacex/model/rocket_model.dart';
import 'package:spacex/repo/rocket_repo.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
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

  test('rocket.get.one.200', () async {
    const id = '5e9d0d95eda69973a809d1ec';
    const route = '/v4/rockets/$id';

    adapter.onGet(route, (server) {
      return server.reply(200, exampleJsonRocket,
          delay: const Duration(seconds: 1));
    });

    final service = RocketRepository(dio: dio);
    final expectRes = RocketModel.fromJson(exampleJsonRocket);
    final actualRes = await service.getOne(id);

    expect(actualRes, equals(expectRes));
  });

  test('rcoket.get.one.error', () async {
    const id = '5e9d0d95eda69973a809d1ec';
    const route = '/v4/rockets/$id';
    const errorCode = 500;

    adapter.onGet(route, (server) {
      return server.reply(errorCode, exampleJsonRocket,
          delay: const Duration(seconds: 1));
    });

    final service = RocketRepository(dio: dio);

    expect(() async => await service.getOne(id), throwsA(predicate((e) {
      return e is Exception &&
          e.toString() == 'Exception: failed with status code $errorCode';
    })));
  });
}
