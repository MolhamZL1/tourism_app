import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/features/Auth/data/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final ApiService apiService;

  AuthRepoImp(this.apiService);

  @override
  Future<Either<ServerFailure, String>> fetchLogin(
      {required String email, required String password}) async {
    try {
      Map<String, dynamic> data = await apiService.post(
        endPoint: "loginAdmin",
        body: {
          "email": email,
          "password": password,
        },
      );
      return right(data["token"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> fetchLogout() async {
    try {
      Map<String, dynamic> data = await apiService.get(
        endPoint: "logoutAdmin",
      );
      return right(data["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
