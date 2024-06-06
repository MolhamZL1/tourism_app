import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Trips/data/models/trip_model.dart';
import 'package:tourism_app/features/Trips/data/repos/trips_repo.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  TripCubit(this.tripsRepo) : super(TripInitial());
  final TripsRepo tripsRepo;
  Future<void> getTrips() async {
    emit(TripLoading());
    var result = await tripsRepo.getTrips();
    result.fold(
      (failure) => emit(TripFailure(errMessage: failure.errMessage)),
      (trips) => emit(TripSuccess(trips: trips)),
    );
  }
}
