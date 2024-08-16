part of 'edit_user_cubit.dart';

sealed class EditUserState extends Equatable {
  const EditUserState();

  @override
  List<Object> get props => [];
}

final class EditUserInitial extends EditUserState {}

final class EditUserSuccess extends EditUserState {}

final class EditUserLoading extends EditUserState {}

final class EditUserFailure extends EditUserState {
  final String errMessage;

  const EditUserFailure({required this.errMessage});
}
