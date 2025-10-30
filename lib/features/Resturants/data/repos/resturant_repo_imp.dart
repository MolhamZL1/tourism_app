import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/features/Resturants/data/models/resturant_model/resturant_model.dart';
import '../../../../core/utils/api_service.dart';
import 'resturant_repo.dart';

class ResturantRepoImp extends ResturantRepo {
  final ApiService apiService;

  ResturantRepoImp(this.apiService);

  @override
  Future<Either<ServerFailure, String>> addResturant(
      {required ResturantModel resturantModel,
      required Uint8List photo}) async {
    try {
      FormData formData = FormData.fromMap({
        "RestaurantName": resturantModel.restaurantName,
        "x": double.tryParse(resturantModel.x!),
        "y": double.tryParse(resturantModel.y!),
        "location": resturantModel.location,
        "PhoneOFRestaurant": resturantModel.phoneOfRestaurant,
        "description": resturantModel.description,
        "photo": MultipartFile.fromBytes(
          photo, filename: 'photo1.jpg', // Specify the filename if needed
        ),
        "food": resturantModel.food,
        "service": resturantModel.service,
        "comforts": resturantModel.comforts,
        "safe": resturantModel.safe,
        "Rate": resturantModel.rate,
        "nameOfCountry": resturantModel.contrey!.name,
        "opening_hours": resturantModel.openingHours,
        "closing_hours": resturantModel.closingHours,
      });
      await apiService.post(endPoint: "inputrestaurant", body: formData);

      return right("success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> deleteResturant(
      {required int id}) async {
    try {
      await apiService
          .post(endPoint: "deleterestaurant", body: {"idrestaurant": id});

      return right("Success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<ResturantModel>>> getResturant() async {
    try {
      var data = await apiService.get(
        endPoint: "getrestaurant",
      );
      List<ResturantModel> resturants = [];
      for (var resturant in data["data"]) {
        resturants.add(ResturantModel.fromJson(resturant));
      }
      return right(resturants);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> updateResturant(
      {required ResturantModel? resturantModel,
      required Uint8List? photo}) async {
    try {
      FormData formData = FormData.fromMap({
        "idrestaurant": resturantModel?.id,
        "x": double.tryParse(resturantModel?.x ?? ""),
        "y": double.tryParse(resturantModel?.y ?? ""),
        "RestaurantName": resturantModel?.restaurantName,
        "location": resturantModel?.location,
        "PhoneOFRestaurant": resturantModel?.phoneOfRestaurant,
        "description": resturantModel?.description,
        "photo": photo == null
            ? null
            : MultipartFile.fromBytes(
                photo, filename: 'photo1.jpg', // Specify the filename if needed
              ),
        "food": resturantModel?.food,
        "service": resturantModel?.service,
        "comforts": resturantModel?.comforts,
        "safe": resturantModel?.safe,
        "Rate": resturantModel?.rate,
        "nameOfCountry": resturantModel?.contrey?.name,
        "opening_hours": resturantModel?.openingHours,
        "closing_hours": resturantModel?.closingHours,
      });
      await apiService.post(endPoint: "restaurantupdate", body: formData);

      return right("success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
