import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/features/Resturants/data/models/resturant_model/resturant_model.dart';

abstract class ResturantRepo {
  Future<Either<ServerFailure, List<ResturantModel>>> getResturant();

  Future<Either<ServerFailure, String>> addResturant({
    required ResturantModel resturantModel,
    required Uint8List photo,
  });

  Future<Either<ServerFailure, String>> deleteResturant({
    required int id,
  });

  Future<Either<ServerFailure, String>> updateResturant({
    required ResturantModel? resturantModel,
    required Uint8List? photo,
  });
}
