

import 'package:dio/dio.dart';
import 'package:spacex/model/rocket_model.dart';

class RocketRepository {
  Dio dio;

  RocketRepository({required this.dio});

  Future<RocketModel> getOne(String id) async {
    var res = await dio.get('');
    if (res.statusCode == 200) {

    }
    throw Exception('failed with status code ${res.statusCode}');
  }
}