import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/repos/airPalneCompanyRepo.dart';
part 'edit_company_state.dart';

class EditCompanyCubit extends Cubit<EditCompanyState> {
  EditCompanyCubit(this.airPalneCompanyRepo) : super(EditCompanyInitial());
  final AirPalneCompanyRepo airPalneCompanyRepo;
  Future<void> addCompany(
      {required String name,
      required String description,
      required String location}) async {
    emit(EditCompanyLoading());
    var result = await airPalneCompanyRepo.addAirPlaneCompany(
        name: name, description: description, location: location);
    result.fold(
      (failure) => emit(EditCompanyFailure(errMessage: failure.errMessage)),
      (success) => emit(EditCompanySuccess()),
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

  Future<void> updateCompany(
      {required int id,
      required String name,
      required String location,
      required String description}) async {
    emit(EditCompanyLoading());
    var result = await airPalneCompanyRepo.updateAirPlaneCompany(
        id: id, name: name, location: location, description: description);
    result.fold(
      (failure) => emit(EditCompanyFailure(errMessage: failure.errMessage)),
      (success) => emit(EditCompanySuccess()),
    );
  }
}
