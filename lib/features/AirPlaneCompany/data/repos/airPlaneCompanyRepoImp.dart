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
      required String description}) async {
    try {
      var data = await apiService.post(
          endPoint: "InputAirPlaneCompany",
          body: {'name': name, 'Rate': location, 'photo': description});

      return right(data["message"]);
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
      var data = await apiService
          .post(endPoint: "DropAirplaneCompany", body: {'id': id});

      return right(data["message"]);
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
      required String name,
      required String location,
      required String description}) async {
    try {
      var data =
          await apiService.post(endPoint: "updateAirplaneCompany", body: {
        'idOldName': id,
        'NewName': name,
        'photo': location,
        'Rate': description,
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
