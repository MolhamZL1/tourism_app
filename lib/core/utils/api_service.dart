import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  static String baseURL =
      kIsWeb ? "http://127.0.0.1:8000" : "http://192.168.1.105:8000";
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
      {required String endPoint, required dynamic body}) async {
    var response = await dio.post("$baseURL/api/$endPoint",
        data: body,
        options: Options(headers: {
          "Authorization":
              "Bearer 1|MnQilmZvLVHxJTa6BCPTddKgtiGewiayI1UathsPba6b81ef",
        }));
    return response.data;
  }
}
