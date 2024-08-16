import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/models/airPlaneCompanyModel.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/repos/airPalneCompanyRepo.dart';

class AirPlaneCompanyrepoImp implements AirPalneCompanyRepo {
  final ApiService apiService;

  AirPlaneCompanyrepoImp(this.apiService);
  @override
  Future<Either<ServerFailure, List<AirPlaneCompanyModel>>>
      getAirPlaneCompanies() async {
    try {
      var data = await apiService.get(
        endPoint: "getcompany",
      );
      List<AirPlaneCompanyModel> companies = [];
      for (var company in data["data"]) {
        companies.add(AirPlaneCompanyModel.fromJson(company));
      }
      return right(companies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> addAirPlaneCompany(
      {required String name,
      required String location,
      required String description,
      required Uint8List photo,
      required String rate,
      required String food,
      required String service,
      required String comforts,
      required String safe,
      required String country}) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "location": location,
        "description": description,
        "photo": MultipartFile.fromBytes(
          photo,
          filename: 'photo.jpg',
        ),
        "Rate": rate,
        "food": food,
        "service": service,
        "Comforts": comforts,
        "safe": safe,
        "nameOfCountry": country
      });
      await apiService.post(endPoint: "InputAirPlaneCompany", body: formData);
      return right("success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> updateAirPlaneCompany(
      {required int id,
      String? name,
      String? location,
      String? description,
      Uint8List? photo,
      String? rate,
      String? food,
      String? service,
      String? comforts,
      String? safe,
      String? country}) async {
    try {
      FormData formData = FormData.fromMap({
        "idOldName": id,
        "NewName": name,
        "NewLocation": location,
        "description": description,
        "photo": photo == null
            ? ""
            : MultipartFile.fromBytes(
                photo,
                filename: 'photo.jpg',
              ),
        "Rate": rate,
        "food": food,
        "service": service,
        "Comforts": comforts,
        "safe": safe,
        "nameOfCountry": country
      });
      await apiService.post(endPoint: "updateAirplaneCompany", body: formData);

      return right("success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> deleteAirPlaneCompany(
      {required int id}) async {
    try {
      await apiService.post(endPoint: "DropAirplaneCompany", body: {'id': id});

      return right("success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
