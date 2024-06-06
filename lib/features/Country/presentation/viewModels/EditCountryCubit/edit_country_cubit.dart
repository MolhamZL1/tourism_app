import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Country/data/repos/countryRepo.dart';

part 'edit_country_state.dart';

class EditCountryCubit extends Cubit<EditCountryState> {
  EditCountryCubit(this.countryRepo) : super(EditCountryInitial());
  final CountryRepo countryRepo;
  static File? photo;

  Future<void> addCountry({required String name, required String rate}) async {
    emit(EditCountryLoading());
    var result =
        await countryRepo.addCountry(name: name, photo: photo!, rate: rate);
    result.fold(
      (failure) => emit(EditCountryFailure(errMessage: failure.errMessage)),
      (success) => emit(EditCountrySuccess()),
    );
  }

  Future<void> deleteCountry({required int id}) async {
    emit(EditCountryLoading());
    var result = await countryRepo.deleteCountry(id: id);
    result.fold(
      (failure) => emit(EditCountryFailure(errMessage: failure.errMessage)),
      (success) => emit(EditCountrySuccess()),
    );
  }

  Future<void> updateCountry(
      {required int id, required String name, required String rate}) async {
    emit(EditCountryLoading());
    var result = await countryRepo.updateCountry(
        id: id, newName: name, photo: photo.toString(), rate: rate);
    result.fold(
      (failure) => emit(EditCountryFailure(errMessage: failure.errMessage)),
      (success) => emit(EditCountrySuccess()),
    );
  }
}
