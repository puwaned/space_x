import 'package:dio/dio.dart';
import 'package:spacex/model/launch_pad_model.dart';

class LaunchPadRepository {
  Dio dio;

  LaunchPadRepository({required this.dio});

  Future<LaunchPadModel> getOne(String id) async {
    var res = await dio.get('/v4/launchpads/$id');
    if (res.statusCode == 200) {
      return LaunchPadModel.fromJson(res.data);
    }
    throw Exception('failed with status code ${res.statusCode}');
  }
}
