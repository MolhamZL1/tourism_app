part of 'edit_resturant_cubit.dart';

sealed class EditResturantState extends Equatable {
  const EditResturantState();

  @override
  List<Object> get props => [];
}

final class EditResturantInitial extends EditResturantState {}

final class EditResturantSuccess extends EditResturantState {}

final class EditResturantFailure extends EditResturantState {
  final String errMessage;

  const EditResturantFailure({required this.errMessage});
}

final class EditResturantLoading extends EditResturantState {}
