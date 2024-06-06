import 'package:dartz/dartz.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/features/Trips/data/models/trip_model.dart';

abstract class TripsRepo {
  Future<Either<ServerFailure, List<TripModel>>> getTrips();
  // Future<Either<ServerFailure, String>> addCountry(
  //     {required String name, required String rate, required FormData photo});
  // Future<Either<ServerFailure, String>> deleteCountry({required int id});
  // Future<Either<ServerFailure, String>> updateCountry(
  //     {required int id,
  //     required String newName,
  //     required String rate,
  //     required String photo});
}
