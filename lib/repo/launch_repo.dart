import 'package:dio/dio.dart';
import 'package:spacex/environment.dart';
import 'package:spacex/model/launch_model.dart';
import 'package:spacex/model/share_model.dart';

const int limit = 20;

class LaunchRepository {
  Dio dio;

  LaunchRepository({required this.dio});

  Future<PaginationModel<LaunchModel>> getAll(LaunchFilter filter) async {
    var res = await dio.post('/v5/launches/query', data: {
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
