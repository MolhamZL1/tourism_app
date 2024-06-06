part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final String token;

  const LoginSuccess({required this.token});
}

final class LoginFailure extends LoginState {
  final String errMessage;

  const LoginFailure({required this.errMessage});
}

final class LoginLoading extends LoginState {}
