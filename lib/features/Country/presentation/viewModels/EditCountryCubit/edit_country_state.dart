part of 'edit_country_cubit.dart';

sealed class EditCountryState extends Equatable {
  const EditCountryState();

  @override
  List<Object> get props => [];
}

final class EditCountryInitial extends EditCountryState {}

final class EditCountrySuccess extends EditCountryState {}

final class EditCountryFailure extends EditCountryState {
  final String errMessage;

  const EditCountryFailure({required this.errMessage});
}

final class EditCountryLoading extends EditCountryState {}
