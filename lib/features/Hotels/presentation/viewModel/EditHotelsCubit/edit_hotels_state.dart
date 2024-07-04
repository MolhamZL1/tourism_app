part of 'edit_hotels_cubit.dart';

sealed class EditHotelsState extends Equatable {
  const EditHotelsState();

  @override
  List<Object> get props => [];
}

final class EditHotelsInitial extends EditHotelsState {}

final class EditHotelsSuccess extends EditHotelsState {}

final class EditHotelsLoading extends EditHotelsState {}

final class EditHotelsFailure extends EditHotelsState {
  final String errMessage;

  const EditHotelsFailure({required this.errMessage});
}
