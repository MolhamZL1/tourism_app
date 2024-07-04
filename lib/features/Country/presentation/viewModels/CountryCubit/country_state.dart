part of 'country_cubit.dart';

sealed class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

final class CountryInitial extends CountryState {}

final class CountrySuccess extends CountryState {
  final List<ContryModel> countries;

  const CountrySuccess({required this.countries});
}

final class CountryLoading extends CountryState {}

final class CountryFailure extends CountryState {
  final String errMessage;

  const CountryFailure({required this.errMessage});
}
