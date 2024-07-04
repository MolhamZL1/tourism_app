part of 'hotels_cubit.dart';

sealed class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

final class HotelsInitial extends HotelsState {}

final class HotelsSuccess extends HotelsState {
  final List<HotelModel> hotels;

  const HotelsSuccess({required this.hotels});
}

final class HotelsLoading extends HotelsState {}

final class HotelsFailure extends HotelsState {
  final String errMessage;

  const HotelsFailure({required this.errMessage});
}
