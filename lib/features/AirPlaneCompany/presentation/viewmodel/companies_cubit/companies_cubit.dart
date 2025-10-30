import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/models/airPlaneCompanyModel.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/repos/airPalneCompanyRepo.dart';

part 'companies_state.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  CompaniesCubit(this.airPalneCompanyRepo) : super(CompaniesInitial());
  final AirPalneCompanyRepo airPalneCompanyRepo;
  static List<String> bloccompaniesNames = [];
  List<AirPlaneCompanyModel> bloccompanies = [];

  Future<void> getAirPlaneCompanies() async {
    emit(CompaniesLoading());
    var result = await airPalneCompanyRepo.getAirPlaneCompanies();
    result.fold(
        (failure) => emit(CompaniesFailure(errMessage: failure.errMessage)),
        (companies) {
      emit(CompaniesSuccess(companies: companies));
      bloccompanies.clear();
      bloccompaniesNames.clear();
      for (var company in companies) {
        bloccompanies.add(company);
        bloccompaniesNames.add(company.name!);
      }
    });
  }

  void searchAirPlaneCompany({required String quary}) {
    emit(CompaniesLoading());
    try {
      List<AirPlaneCompanyModel> result = [];
      for (var company in bloccompanies) {
        if (company.name!.toLowerCase().contains(quary.toLowerCase())) {
          result.add(company);
        }
      }
      if (result.isNotEmpty) {
        emit(CompaniesSuccess(companies: result));
      } else {
        emit(const CompaniesFailure(errMessage: "Not Found"));
      }
    } catch (e) {
      emit(CompaniesFailure(errMessage: e.toString()));
    }
  }
}
