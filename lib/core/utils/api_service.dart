import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  static String baseURL = kIsWeb
      ? "http://127.0.0.1:8000"
      : "http://10.0.2.2:8000"; //10.0.2.2  //127.0.0.1
  final Dio dio;

  ApiService(this.dio);

  Future<dynamic> get({required String endPoint}) async {
    var response = await dio.get("$baseURL/api/$endPoint",
        options: Options(headers: {
          "Authorization":
              "Bearer 1|MnQilmZvLVHxJTa6BCPTddKgtiGewiayI1UathsPba6b81ef"
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> body}) async {
    var response = await dio.post("$baseURL/api/$endPoint",
        queryParameters: body,
        options: Options(headers: {
          "Authorization":
              "Bearer 1|MnQilmZvLVHxJTa6BCPTddKgtiGewiayI1UathsPba6b81ef",
        }));
    return response.data;
  }
}
