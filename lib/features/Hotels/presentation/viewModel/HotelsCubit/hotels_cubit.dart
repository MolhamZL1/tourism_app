import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Hotels/data/models/hotel_model/hotel_model.dart';
import 'package:tourism_app/features/Hotels/data/repos/hotel_repo.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit(this.hotelRepo) : super(HotelsInitial());
  final HotelRepo hotelRepo;
  static List<String> blochotelsNames = [];
  List<HotelModel> blochotels = [];
  Future<void> getHotels() async {
    emit(HotelsLoading());
    var result = await hotelRepo.getHotels();
    result.fold(
      (failure) => emit(HotelsFailure(errMessage: failure.errMessage)),
      (hotels) {
        blochotelsNames.clear();
        blochotels.clear();
        for (var hotel in hotels) {
          blochotels.add(hotel);
          blochotelsNames.add(hotel.name!);
        }
        emit(HotelsSuccess(hotels: hotels));
      },
    );
  }

  void searchHotel({required String quary}) {
    emit(HotelsLoading());
    try {
      List<HotelModel> result = [];
      for (var hotel in blochotels) {
        if (hotel.name!.toLowerCase().contains(quary.toLowerCase())) {
          result.add(hotel);
        }
      }
      if (result.isNotEmpty) {
        emit(HotelsSuccess(hotels: result));
      } else {
        emit(const HotelsFailure(errMessage: "Not Found"));
      }
    } catch (e) {
      emit(HotelsFailure(errMessage: e.toString()));
    }
  }
}
