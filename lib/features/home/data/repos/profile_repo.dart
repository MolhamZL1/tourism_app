import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/features/home/data/models/data_user_model.dart';

abstract class ProfileRepo {
  Future<Either<ServerFailure, DataUserModel>> getProfile();
  Future<Either<ServerFailure, String>> updateProfile({
    DataUserModel? dataUserModel,
    String? password,
    Uint8List? photo,
  });
}
