import 'package:dartz/dartz.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/models/airPlaneCompanyModel.dart';

abstract class AirPalneCompanyRepo {
  Future<Either<ServerFailure, List<AirPlaneCompanyModel>>>
      getAirPlaneCompanies();
  Future<Either<ServerFailure, String>> addAirPlaneCompany(
      {required String name,
      required String location,
      required String description});
  Future<Either<ServerFailure, String>> deleteAirPlaneCompany(
      {required int id});
  Future<Either<ServerFailure, String>> updateAirPlaneCompany(
      {required int id,
      required String name,
      required String location,
      required String description});
}
