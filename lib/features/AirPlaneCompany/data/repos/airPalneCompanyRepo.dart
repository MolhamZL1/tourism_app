import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/models/airPlaneCompanyModel.dart';

abstract class AirPalneCompanyRepo {
  Future<Either<ServerFailure, List<AirPlaneCompanyModel>>>
      getAirPlaneCompanies();
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
      required String country});
  Future<Either<ServerFailure, String>> deleteAirPlaneCompany(
      {required int id});
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
      String? country});
}
