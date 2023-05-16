import 'package:dio/dio.dart';
import 'package:spacex/environment.dart';

class DioClient {
  DioClient._();

  static Dio getDioClient() {
    var instance = Dio();
    instance.interceptors.add(QueuedInterceptorsWrapper(
      onRequest: (options, handler) {
        options.baseUrl = AppEnvironment.baseUrl;
        options.responseType = ResponseType.json;
        options.validateStatus = (_) => true;

        return handler.next(options);
      }
    ));
    return instance;
  }
}