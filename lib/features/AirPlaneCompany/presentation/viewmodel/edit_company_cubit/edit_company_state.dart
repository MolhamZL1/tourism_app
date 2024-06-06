part of 'edit_company_cubit.dart';

sealed class EditCompanyState extends Equatable {
  const EditCompanyState();

  @override
  List<Object> get props => [];
}

final class EditCompanyInitial extends EditCompanyState {}

final class EditCompanySuccess extends EditCompanyState {}

final class EditCompanyFailure extends EditCompanyState {
  final String errMessage;

  const EditCompanyFailure({required this.errMessage});
}

final class EditCompanyLoading extends EditCompanyState {}
