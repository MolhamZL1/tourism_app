import 'package:dartz/dartz.dart';
import 'package:tourism_app/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<ServerFailure, String>> fetchLogin(
      {required String email, required String password});
  Future<Either<ServerFailure, String>> fetchLogout();
}
