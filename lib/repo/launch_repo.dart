import 'package:dio/dio.dart';
import 'package:spacex/environment.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/model/share_model.dart';

const int limit = 30;

class LaunchRepository {
  Dio dio = Dio(BaseOptions(
      validateStatus: (_) => true, responseType: ResponseType.json));

  Future<PaginationModel<LaunchModel>> getAll(
      {required int page, String? search}) async {
    var res =
        await dio.post('${AppEnvironment.baseUrl}/v5/launches/query', data: {
      "options": {'limit': limit, 'page': page},
      "query": {
        "name": {"\$regex": search ?? "", "\$options": "i"}
      },
    });
    if (res.statusCode == 200) {
      var docs = LaunchModel.parseList(res.data['docs']);
      return PaginationModel<LaunchModel>.fromJson(res.data, docs);
    }

    throw Exception('failed with status code ${res.statusCode}');
  }

  Future<LaunchModel> getOne(String id) async {
    var res = await dio.get('${AppEnvironment.baseUrl}/v5/launches/$id');
    if (res.statusCode == 200) {
      return LaunchModel.fromJson(res.data);
    }

    throw Exception('failed with status code ${res.statusCode}');
  }
}
