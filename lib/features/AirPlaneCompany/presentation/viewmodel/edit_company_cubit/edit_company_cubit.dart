import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/repos/airPalneCompanyRepo.dart';
part 'edit_company_state.dart';

class EditCompanyCubit extends Cubit<EditCompanyState> {
  EditCompanyCubit(this.airPalneCompanyRepo) : super(EditCompanyInitial());
  final AirPalneCompanyRepo airPalneCompanyRepo;
  static Uint8List? photo;

  Future<void> addCompany(
      {required String name,
      required String description,
      required String location,
      required String rate,
      required String food,
      required String service,
      required String comforts,
      required String safe,
      required String country}) async {
    emit(EditCompanyLoading());
    var result = await airPalneCompanyRepo.addAirPlaneCompany(
        name: name,
        description: description,
        location: location,
        comforts: comforts,
        country: country,
        food: food,
        photo: photo!,
        rate: rate,
        safe: safe,
        service: service);
    result.fold(
      (failure) => emit(EditCompanyFailure(errMessage: failure.errMessage)),
      (success) {
        photo = null;
        emit(EditCompanySuccess());
      },
    );
  }

  Future<void> updateCompany(
      {required int id,
      String? name,
      String? location,
      String? description,
      String? rate,
      String? food,
      String? service,
      String? comforts,
      String? safe,
      String? country}) async {
    emit(EditCompanyLoading());
    var result = await airPalneCompanyRepo.updateAirPlaneCompany(
        id: id,
        name: name,
        location: location,
        description: description,
        comforts: comforts,
        country: country,
        food: food,
        photo: photo,
        rate: rate,
        safe: safe,
        service: service);
    result.fold(
      (failure) => emit(EditCompanyFailure(errMessage: failure.errMessage)),
      (success) {
        photo = null;
        emit(EditCompanySuccess());
      },
    );
  }

  Future<void> deleteCompany({required int id}) async {
    emit(EditCompanyLoading());
    var result = await airPalneCompanyRepo.deleteAirPlaneCompany(id: id);
    result.fold(
      (failure) => emit(EditCompanyFailure(errMessage: failure.errMessage)),
      (success) => emit(EditCompanySuccess()),
    );
  }
}
