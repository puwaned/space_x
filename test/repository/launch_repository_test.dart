// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http_mock_adapter/http_mock_adapter.dart';
// import 'package:spacex/environment.dart';
// import 'package:spacex/model/launch_model.dart';
// import 'package:spacex/model/share_model.dart';
// import 'package:spacex/repo/launch_repo.dart';
//
// import '../common.dart';
//
// main() {
//   final dio = Dio(BaseOptions(
//       baseUrl: AppEnvironment.baseUrl, responseType: ResponseType.json));
//   final dioAdapter = DioAdapter(dio: dio);
//
//   group('Launch repo test', () {
//     test('launch.get.success', () async {
//       dioAdapter.onPost('/v5/launches/query', (server) {
//         return server.reply(200, exampleJsonLunchListWithPagination);
//       }, data: {
//         "options": {
//           'limit': 10,
//           'page': 1,
//           "sort": {"static_fire_date": 'asc', "name": 'asc'}
//         },
//         "query": {
//           "name": {"\$regex": "", "\$options": "i"}
//         },
//       });
//
//       final launchService = LaunchRepository(dio: dio);
//
//       final expectDocs = LaunchModel.parseList(
//           exampleJsonLunchListWithPagination['docs'] as List<dynamic>);
//       final expectResult = PaginationModel<LaunchModel>.fromJson(
//           exampleJsonLunchListWithPagination, expectDocs);
//       final actualResult = await launchService.getAll();
//
//       expect(actualResult, equals(expectResult));
//
//       // final res = await LaunchRepository(dio: dio).getAll(LaunchFilter(page: 1));
//       //
//       // final expectRes = LaunchModel.fromJson(exampleJsonLaunchList);
//       // final actualRes = res.
//       // dioAdapter.onGet('$baseUrl/v5/launches/query', (server) {
//       //   return server.reply(200, data);
//       // },data: );
//     });
//   });
// }
