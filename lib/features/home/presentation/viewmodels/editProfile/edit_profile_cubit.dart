import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/home/data/models/data_user_model.dart';
import 'package:tourism_app/features/home/data/repos/profile_repo.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.profileRepo) : super(EditProfileInitial());
  final ProfileRepo profileRepo;
  static Uint8List? photo;

  Future<void> updateProfile(
      {String? firstName,
      String? lastName,
      String? phoneNumber,
      String? email,
      String? password}) async {
    emit(EditProfileLoading());
    var result = await profileRepo.updateProfile(
        dataUserModel: DataUserModel(
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            email: email),
        photo: photo,
        password: password);
    result.fold(
      (failure) => emit(EditProfileFailure(errMessage: failure.errMessage)),
      (success) {
        photo = null;
        emit(EditProfileSuccess());
      },
    );
  }
}
