part of 'edit_trip_cubit.dart';

sealed class EditTripState extends Equatable {
  const EditTripState();

  @override
  List<Object> get props => [];
}

final class EditTripInitial extends EditTripState {}

final class EditTripSuccess extends EditTripState {}

final class EditTripFailure extends EditTripState {
  final String errMessage;

  const EditTripFailure({required this.errMessage});
}

final class EditTripLoading extends EditTripState {}
