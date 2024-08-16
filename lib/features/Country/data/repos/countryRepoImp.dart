import 'dart:typed_data';
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
  Future<Either<ServerFailure, List<ContryModel>>> getCountries() async {
    try {
      var data = await apiService.get(
        endPoint: "ReturnCountreyForAdmin",
      );
      List<ContryModel> countries = [];
      for (var country in data["data"]) {
        countries.add(ContryModel.fromJson(country));
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
  Future<Either<ServerFailure, String>> addCountry({
    required String name,
    required String rate,
    required Uint8List photo,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'Rate': rate,
        'photo': MultipartFile.fromBytes(
          photo, filename: 'photo.jpg', // Specify the filename if needed
        ),
      });
      var data =
          await apiService.post(endPoint: "InputCountry", body: formData);
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
      String? newName,
      String? rate,
      Uint8List? photo}) async {
    try {
      FormData formData = FormData.fromMap({
        'idOldName': id,
        'NewName': newName,
        'Rate': rate,
        'photo': photo == null
            ? null
            : MultipartFile.fromBytes(
                photo,
                filename: 'photo.jpg',
              ),
      });
      var data = await apiService.post(
          endPoint: "UpdateInformationContrey", body: formData);
      return right(data["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
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
  Future<Either<ServerFailure, List<ContryModel>>> searchCountries(
      {required String text}) async {
    try {
      var data = await apiService.get(
        //edit end point and add text
        endPoint: "ReturnCountreyForAdmin",
      );
      List<ContryModel> countries = [];
      for (var country in data["data"]) {
        countries.add(ContryModel.fromJson(country));
      }
      return right(countries);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
