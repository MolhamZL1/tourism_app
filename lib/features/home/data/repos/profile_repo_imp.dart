import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/core/utils/api_service.dart';

import 'package:tourism_app/features/home/data/models/data_user_model.dart';

import 'profile_repo.dart';

class ProfileRepoImp extends ProfileRepo {
  final ApiService apiService;

  ProfileRepoImp(this.apiService);
  @override
  Future<Either<ServerFailure, DataUserModel>> getProfile() async {
    try {
      var data = await apiService.get(
        endPoint: "adminProfile",
      );

      return right(DataUserModel.fromJson(data["data"]));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> updateProfile({
    DataUserModel? dataUserModel,
    String? password,
    Uint8List? photo,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "Firstname": dataUserModel?.firstName,
        "Lastname": dataUserModel?.lastName,
        "visaphoto": MultipartFile.fromBytes(
          photo!, filename: 'photo.jpg', // Specify the filename if needed
        ),
        "phone": dataUserModel?.phoneNumber,
        "email": dataUserModel?.email,
        "password": password
      });
      await apiService.post(endPoint: "updateadminprofile", body: formData);
      return right("success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
