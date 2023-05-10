import 'package:dio/dio.dart';
import 'package:spacex/model/rocket_model.dart';

class RocketRepository {
  Dio dio;

  RocketRepository({required this.dio});

  Future<RocketModel> getOne(String id) async {
    var res = await dio.get('/v4/rockets/$id');
    if (res.statusCode == 200) {
      return RocketModel.fromJson(res.data);
    }
    throw Exception('failed with status code ${res.statusCode}');
  }
}
