import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/features/Trips/data/models/trip_model.dart';
import 'package:tourism_app/features/Trips/data/repos/trips_repo.dart';

class TripsRepoImp implements TripsRepo {
  final ApiService apiService;

  TripsRepoImp(this.apiService);
  @override
  Future<Either<ServerFailure, List<TripModel>>> getTrips() async {
    try {
      var data = await apiService.get(
        endPoint: "gettrip",
      );
      List<TripModel> trips = [];
      for (var trip in data["data"]) {
        trips.add(TripModel.fromJson(trip));
      }
      return right(trips);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
