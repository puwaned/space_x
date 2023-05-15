import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:spacex/environment.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/model/share_model.dart';
import 'package:spacex/repo/launch_repo.dart';

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

  test('launch.get-all.success', () async {
    const route = '/v5/launches/query';
    final filter = LaunchFilter(page: 1);

    adapter.onPost(route, (server) {
      return server.reply(200, exampleJsonLunchListWithPagination,
          delay: const Duration(seconds: 1));
    }, data: {
      "options": {
        'limit': limit,
        'page': filter.page,
        "sort": {
          "static_fire_date": filter.sortFireDate == 0 ? 'asc' : 'desc',
          "name": filter.sortName == 0 ? 'asc' : 'desc'
        }
      },
      "query": {
        "name": {"\$regex": filter.search ?? "", "\$options": "i"}
      },
    });

    final service = LaunchRepository(dio: dio);

    final docs = LaunchModel.parseList(
        exampleJsonLunchListWithPagination['docs'] as List<dynamic>);
    final expectRes =
        PaginationModel.fromJson(exampleJsonLunchListWithPagination, docs);
    final actualRes = await service.getAll(filter);

    expect(actualRes, equals(expectRes));
  });

  test('launch.get-all.error', () async {
    const route = '/v5/launches/query';
    const errorCode = 500;
    final filter = LaunchFilter(page: 1);

    adapter.onPost(route, (server) {
      return server.reply(errorCode, exampleJsonLunchListWithPagination,
          delay: const Duration(seconds: 1));
    }, data: {
      "options": {
        'limit': limit,
        'page': filter.page,
        "sort": {
          "static_fire_date": filter.sortFireDate == 0 ? 'asc' : 'desc',
          "name": filter.sortName == 0 ? 'asc' : 'desc'
        }
      },
      "query": {
        "name": {"\$regex": filter.search ?? "", "\$options": "i"}
      },
    });

    final service = LaunchRepository(dio: dio);

    expect(() async => await service.getAll(filter), throwsA(predicate((e) {
      return e is Exception &&
          e.toString() == 'Exception: failed with status code $errorCode';
    })));
  });
}
