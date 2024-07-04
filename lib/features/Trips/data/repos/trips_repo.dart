import 'package:dartz/dartz.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/features/Trips/data/models/trip_model.dart';

abstract class TripsRepo {
  Future<Either<ServerFailure, List<TripModel>>> getTrips();
  Future<Either<ServerFailure, String>> addTrip(
      {required String place,
      required String time,
      required int price,
      required int amountPeople,
      required String country,
      required String company});
  Future<Either<ServerFailure, String>> updateCountry(
      {required int id,
      String? place,
      String? time,
      int? price,
      int? amountPeople,
      required String country,
      required String company});
  Future<Either<ServerFailure, String>> deleteTrip({required int id});
}
