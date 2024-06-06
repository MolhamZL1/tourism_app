import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/models/airPlaneCompanyModel.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/repos/airPalneCompanyRepo.dart';

part 'companies_state.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesCubit(this.airPalneCompanyRepo) : super(CompaniesInitial());
  final AirPalneCompanyRepo airPalneCompanyRepo;
  Future<void> getAirPlaneCompanies() async {
    emit(CompaniesLoading());
    var result = await airPalneCompanyRepo.getAirPlaneCompanies();
    result.fold(
      (failure) => emit(CompaniesFailure(errMessage: failure.errMessage)),
      (companies) => emit(CompaniesSuccess(companies: companies)),
    );
  }
}
