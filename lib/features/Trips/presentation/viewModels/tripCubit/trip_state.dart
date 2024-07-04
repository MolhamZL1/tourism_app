part of 'trip_cubit.dart';

sealed class TripState extends Equatable {
  const TripState();

  @override
  List<Object> get props => [];
}

final class TripInitial extends TripState {}

final class TripSuccess extends TripState {
  final List<TripModel> trips;

  const TripSuccess({required this.trips});
}

final class TripFailure extends TripState {
  final String errMessage;

  const TripFailure({required this.errMessage});
}

final class TripLoading extends TripState {}
