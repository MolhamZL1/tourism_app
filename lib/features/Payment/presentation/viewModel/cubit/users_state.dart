part of 'users_cubit.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

final class UsersLoading extends UsersState {}

final class UsersSuccess extends UsersState {}

final class UsersFailure extends UsersState {
  final String errMessage;

  const UsersFailure({required this.errMessage});
}
