import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/home/data/models/data_user_model.dart';
import 'package:tourism_app/features/home/data/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> getProfile() async {
    emit(ProfileLoading());
    var result = await profileRepo.getProfile();
    result.fold(
      (failure) => emit(ProfileFailure(errMessage: failure.errMessage)),
      (success) {
        emit(ProfileSuccess(dataUserModel: success));
      },
    );
  }
}
