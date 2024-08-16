import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Trips/data/models/trip_model.dart';
import 'package:tourism_app/features/Trips/data/repos/trips_repo.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  TripCubit(this.tripsRepo) : super(TripInitial());
  final TripsRepo tripsRepo;
  List<TripModel> blocTrips = [];

  Future<void> getTrips() async {
    emit(TripLoading());
    var result = await tripsRepo.getTrips();
    result.fold(
      (failure) => emit(TripFailure(errMessage: failure.errMessage)),
      (trips) {
        blocTrips.clear();
        for (var trip in trips) {
          blocTrips.add(trip);
        }
        emit(TripSuccess(trips: trips));
      },
    );
  }

  void searchHotel({required String quary}) {
    emit(TripLoading());
    try {
      List<TripModel> result = [];
      for (var trip in blocTrips) {
        if (trip.tripPlace.toLowerCase().contains(quary.toLowerCase())) {
          result.add(trip);
        }
      }
      if (result.isNotEmpty) {
        emit(TripSuccess(trips: result));
      } else {
        emit(const TripFailure(errMessage: "Not Found"));
      }
    } catch (e) {
      emit(TripFailure(errMessage: e.toString()));
    }
  }
}
