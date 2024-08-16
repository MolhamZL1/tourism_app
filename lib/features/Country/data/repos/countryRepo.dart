import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';

abstract class CountryRepo {
  Future<Either<ServerFailure, List<ContryModel>>> getCountries();
  Future<Either<ServerFailure, List<ContryModel>>> searchCountries(
      {required String text});

  Future<Either<ServerFailure, String>> addCountry(
      {required String name, required String rate, required Uint8List photo});

  Future<Either<ServerFailure, String>> deleteCountry({required int id});

  Future<Either<ServerFailure, String>> updateCountry(
      {required int id,
      required String? newName,
      required String? rate,
      required Uint8List? photo});
}
