import 'package:dartz/dartz.dart';
import 'package:tourism_app/features/Payment/data/models/user_model/user_model.dart';

import '../../../../core/errors/failure.dart';

abstract class PaymentRepo {
  Future<Either<ServerFailure, List<UserModel>>> getUsers();
  Future<Either<ServerFailure, String>> chargeMoney(
      {required double money, required int id});
  Future<Either<ServerFailure, String>> deleteUser({required int id});
}
