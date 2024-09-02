import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();
  DioClient();

  Future<Response> get(String path) async {
    return _dio.get(path);
  }
}
