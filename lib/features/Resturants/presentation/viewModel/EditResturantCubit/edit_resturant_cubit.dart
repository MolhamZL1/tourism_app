import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Resturants/data/repos/resturant_repo.dart';

import '../../../data/models/resturant_model/resturant_model.dart';

part 'edit_resturant_state.dart';

class EditResturantCubit extends Cubit<EditResturantState> {
  EditResturantCubit(this._resturantRepo) : super(EditResturantInitial());
  final ResturantRepo _resturantRepo;
  static Uint8List? photo;

  Future<void> addResturant({required ResturantModel resturantModel}) async {
    emit(EditResturantLoading());
    var result = await _resturantRepo.addResturant(
      resturantModel: resturantModel,
      photo: photo!,
    );
    result.fold(
      (failure) => emit(EditResturantFailure(errMessage: failure.errMessage)),
      (success) {
        photo = null;
        emit(EditResturantSuccess());
      },
    );
  }

  Future<void> deleteResturant({required int id}) async {
    emit(EditResturantLoading());
    var result = await _resturantRepo.deleteResturant(id: id);
    result.fold(
      (failure) => emit(EditResturantFailure(errMessage: failure.errMessage)),
      (success) => emit(EditResturantSuccess()),
    );
  }

  Future<void> updateResturant({required ResturantModel resturantModel}) async {
    emit(EditResturantLoading());
    var result = await _resturantRepo.updateResturant(
      resturantModel: resturantModel,
      photo: photo,
    );
    result.fold(
      (failure) => emit(EditResturantFailure(errMessage: failure.errMessage)),
      (success) {
        photo = null;
        emit(EditResturantSuccess());
      },
    );
  }
}
