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

  @override
  Future<Either<ServerFailure, String>> addTrip(
      {required String place,
      required String time,
      required int price,
      required int amountPeople,
      required String country,
      required String company}) async {
    try {
      var data = await apiService.post(endPoint: "InputFlightTrip", body: {
        "TripPlace": place,
        "TimeTrip": time,
        "Price": price,
        "amountpeople": amountPeople,
        "CountrynameTowards": country,
        "nameCompany": company,
      });
      return right(data["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> updateCountry(
      {required int id,
      String? place,
      String? time,
      int? price,
      int? amountPeople,
      String? country,
      String? company}) async {
    try {
      var data = await apiService.post(endPoint: "UpdateFlightTrip", body: {
        "id": id,
        "NewTripPlace": place,
        "TimeTrip": time,
        "Price": price,
        "amountpeople": amountPeople,
        "CountrynameTowards": country,
        "nameCompany": company,
      });
      return right(data["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> deleteTrip({required int id}) async {
    try {
      var data =
          await apiService.post(endPoint: "DropFlightTrip", body: {"id": id});

      return right(data["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
