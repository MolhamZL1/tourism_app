import 'package:dartz/dartz.dart';
import 'package:tourism_app/features/Users/data/models/user_model/user_model.dart';

import '../../../../core/errors/failure.dart';

abstract class PaymentRepo {
  Future<Either<ServerFailure, List<UserModel>>> getUsers();
  Future<Either<ServerFailure, String>> chargeMoney(
      {required double money,
      int? id,
      String? email,
      required String operationType});
  Future<Either<ServerFailure, String>> deleteUser({required int id});
}
