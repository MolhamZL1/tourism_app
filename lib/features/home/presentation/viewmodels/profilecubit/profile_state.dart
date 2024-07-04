part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final DataUserModel dataUserModel;

  const ProfileSuccess({required this.dataUserModel});
}

final class ProfileFailure extends ProfileState {
  final String errMessage;

  const ProfileFailure({required this.errMessage});
}

final class ProfileLoading extends ProfileState {}
