import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';

abstract class CountryRepo {
  Future<Either<ServerFailure, List<CountryModel>>> getCountries();

  Future<Either<ServerFailure, String>> addCountry(
      {required String name, required String rate, required File photo});

  Future<Either<ServerFailure, String>> deleteCountry({required int id});

  Future<Either<ServerFailure, String>> updateCountry(
      {required int id,
      required String newName,
      required String rate,
      required String photo});
}
