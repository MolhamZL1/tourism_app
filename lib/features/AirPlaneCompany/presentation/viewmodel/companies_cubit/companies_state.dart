part of 'companies_cubit.dart';

sealed class CompaniesState extends Equatable {
  const CompaniesState();

  @override
  List<Object> get props => [];
}

final class CompaniesInitial extends CompaniesState {}

final class CompaniesSuccess extends CompaniesState {
  final List<AirPlaneCompanyModel> companies;

  const CompaniesSuccess({required this.companies});
}

final class CompaniesFailure extends CompaniesState {
  final String errMessage;

  const CompaniesFailure({required this.errMessage});
}

final class CompaniesLoading extends CompaniesState {}
