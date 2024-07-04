import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Hotels/data/models/hotel_model/hotel_model.dart';
import 'package:tourism_app/features/Hotels/data/repos/hotel_repo.dart';
part 'edit_hotels_state.dart';

class EditHotelsCubit extends Cubit<EditHotelsState> {
  EditHotelsCubit(this.hotelRepo) : super(EditHotelsInitial());
  final HotelRepo hotelRepo;
  static Uint8List? basephoto;
  static Uint8List? firstroomPhoto;
  static Uint8List? secondRoomPhoto;
  static Uint8List? thirdRoomPhoto;

  Future<void> addHotel({required HotelModel hotelModel}) async {
    emit(EditHotelsSuccess());
    var result = await hotelRepo.addHotel(
      hotelModel: hotelModel,
      basephoto: basephoto!,
      firstroomPhoto: firstroomPhoto!,
      secondRoomPhoto: secondRoomPhoto!,
      thirdRoomPhoto: thirdRoomPhoto!,
    );
    result.fold(
      (failure) => emit(EditHotelsFailure(errMessage: failure.errMessage)),
      (success) {
        basephoto = null;
        firstroomPhoto = null;
        secondRoomPhoto = null;
        thirdRoomPhoto = null;
        emit(EditHotelsSuccess());
      },
    );
  }

  Future<void> deleteHotel({required int id}) async {
    emit(EditHotelsLoading());
    var result = await hotelRepo.deleteHotel(id: id);
    result.fold(
      (failure) => emit(EditHotelsFailure(errMessage: failure.errMessage)),
      (success) => emit(EditHotelsSuccess()),
    );
  }

  Future<void> updateHotel({required HotelModel hotelModel}) async {
    emit(EditHotelsLoading());
    var result = await hotelRepo.updateHotel(
      hotelModel: hotelModel,
      basephoto: basephoto,
      firstroomPhoto: firstroomPhoto,
      secondRoomPhoto: secondRoomPhoto,
      thirdRoomPhoto: thirdRoomPhoto,
    );
    result.fold(
      (failure) => emit(EditHotelsFailure(errMessage: failure.errMessage)),
      (success) {
        basephoto = null;
        firstroomPhoto = null;
        secondRoomPhoto = null;
        thirdRoomPhoto = null;
        emit(EditHotelsSuccess());
      },
    );
  }
}
