import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Hotels/data/models/hotel_model/hotel_model.dart';
import 'package:tourism_app/features/Hotels/data/repos/hotel_repo.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit(this.hotelRepo) : super(HotelsInitial());
  final HotelRepo hotelRepo;
  static List<String> blochotels = [];
  Future<void> getHotels() async {
    emit(HotelsLoading());
    var result = await hotelRepo.getHotels();
    result.fold(
      (failure) => emit(HotelsFailure(errMessage: failure.errMessage)),
      (hotels) {
        emit(HotelsSuccess(hotels: hotels));
        blochotels.clear();
        for (var hotel in hotels) {
          blochotels.add(hotel.name!);
        }
      },
    );
  }
}
