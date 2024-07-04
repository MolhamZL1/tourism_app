import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:tourism_app/core/errors/failure.dart';

import 'package:tourism_app/features/Payment/data/models/user_model/user_model.dart';

import '../../../../core/utils/api_service.dart';
import 'payment_repo.dart';

class PaymentRepoImp extends PaymentRepo {
  final ApiService apiService;

  PaymentRepoImp(this.apiService);

  @override
  Future<Either<ServerFailure, String>> chargeMoney(
      {required double money, required int id}) async {
    try {
      await apiService.post(
          endPoint: "UpdateClientAccount",
          body: {"idaccount": id, "Balance": money});

      return right("success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> deleteUser({required int id}) async {
    try {
      await apiService
          .post(endPoint: "DeleteAccountClient", body: {"idaccount": id});

      return right("deleted");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<UserModel>>> getUsers() async {
    try {
      var data = await apiService.get(
        endPoint: "getClientsAccount",
      );
      List<UserModel> users = [];
      for (var user in data["data"]) {
        users.add(UserModel.fromJson(user));
      }
      return right(users);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
