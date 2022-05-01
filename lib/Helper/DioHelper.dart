import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    Dio(
      BaseOptions(
        baseUrl: "https://sumanjay.vercel.app/",
        connectTimeout: 50000,
        receiveTimeout: 50000,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getDate({
    required Map<String, dynamic> query,
  }) async {
    return await dio.get("udemy", queryParameters: query);
  }
}
