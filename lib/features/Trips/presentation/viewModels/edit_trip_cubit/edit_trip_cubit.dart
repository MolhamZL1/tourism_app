import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Trips/data/repos/trips_repo.dart';
part 'edit_trip_state.dart';

class EditTripCubit extends Cubit<EditTripState> {
  EditTripCubit(this.tripsRepo) : super(EditTripInitial());
  final TripsRepo tripsRepo;
  Future<void> addTrip(
      {required String place,
      required String time,
      required int price,
      required int amountPeople,
      required String country,
      required String company}) async {
    emit(EditTripLoading());
    var result = await tripsRepo.addTrip(
        amountPeople: amountPeople,
        company: company,
        country: country,
        place: place,
        price: price,
        time: time);
    result.fold(
      (failure) => emit(EditTripFailure(errMessage: failure.errMessage)),
      (success) => emit(EditTripSuccess()),
    );
  }

  Future<void> deleteTrip({required int id}) async {
    emit(EditTripLoading());
    var result = await tripsRepo.deleteTrip(id: id);
    result.fold(
      (failure) => emit(EditTripFailure(errMessage: failure.errMessage)),
      (success) => emit(EditTripSuccess()),
    );
  }

  Future<void> updateTrip(
      {required int id,
      String? place,
      String? time,
      int? price,
      int? amountPeople,
      required String country,
      required String company}) async {
    emit(EditTripLoading());
    var result = await tripsRepo.updateCountry(
        id: id,
        amountPeople: amountPeople,
        company: company,
        country: country,
        place: place,
        price: price,
        time: time);
    result.fold(
      (failure) => emit(EditTripFailure(errMessage: failure.errMessage)),
      (success) => emit(EditTripSuccess()),
    );
  }
}
