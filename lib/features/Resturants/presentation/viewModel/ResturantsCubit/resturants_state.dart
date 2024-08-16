part of 'resturants_cubit.dart';

sealed class ResturantsState extends Equatable {
  const ResturantsState();

  @override
  List<Object> get props => [];
}

final class ResturantsInitial extends ResturantsState {}

final class ResturantsSuccess extends ResturantsState {
  final List<ResturantModel> restaurants;

  const ResturantsSuccess({required this.restaurants});
}

final class ResturantsFailure extends ResturantsState {
  final String errMessage;

  const ResturantsFailure({required this.errMessage});
}

final class ResturantsLoading extends ResturantsState {}
