import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';
import 'package:tourism_app/features/Country/data/repos/countryRepo.dart';

class CountryRepoImp extends CountryRepo {
  final ApiService apiService;

  CountryRepoImp(this.apiService);

  @override
  Future<Either<ServerFailure, List<CountryModel>>> getCountries() async {
    try {
      var data = await apiService.get(
        endPoint: "ReturnCountreyForAdmin",
      );
      List<CountryModel> countries = [];
      for (var country in data["data"]) {
        countries.add(CountryModel.fromJson(country));
      }
      return right(countries);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> addCountry(
      {required String name, required String rate, required File photo}) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${ApiService.baseURL}/api/InputCountry"),
      );
      request.fields.addAll({
        'name': name,
        'Rate': rate,
      });
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization":
            "Bearer 1|MnQilmZvLVHxJTa6BCPTddKgtiGewiayI1UathsPba6b81ef",
      };
      request.files.add(await http.MultipartFile.fromPath(
        'photo',
        photo.path,
      ));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseData = jsonDecode(await response.stream.bytesToString());
        String message = responseData['message'];
        return right(message);
      } else if (response.statusCode == 422) {
      } else {
        throw Exception("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
    return right("success");
  }

  @override
  Future<Either<ServerFailure, String>> deleteCountry({required int id}) async {
    try {
      var data =
          await apiService.post(endPoint: "DropCountry", body: {"id": id});

      return right(data["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> updateCountry(
      {required int id,
      required String newName,
      required String rate,
      required String photo}) async {
    try {
      var data =
          await apiService.post(endPoint: "UpdateInformationContrey", body: {
        'idOldName': id,
        'NewName': newName,
        'photo': photo,
        'Rate': rate,
      });

      return right(data["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
