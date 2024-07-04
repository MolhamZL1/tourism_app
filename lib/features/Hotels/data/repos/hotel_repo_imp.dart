import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/features/Hotels/data/models/hotel_model/hotel_model.dart';
import 'package:tourism_app/features/Hotels/data/repos/hotel_repo.dart';

class HotelRepoImp extends HotelRepo {
  final ApiService apiService;

  HotelRepoImp(this.apiService);
  @override
  Future<Either<ServerFailure, String>> addHotel(
      {required HotelModel hotelModel,
      required Uint8List basephoto,
      required Uint8List firstroomPhoto,
      required Uint8List secondRoomPhoto,
      required Uint8List thirdRoomPhoto}) async {
    try {
      FormData formData = FormData.fromMap({
        "name": hotelModel.name,
        "location": hotelModel.location,
        "description": hotelModel.description,
        "Basicphoto": MultipartFile.fromBytes(
          basephoto, filename: 'photo1.jpg', // Specify the filename if needed
        ),
        "Roomphoto1": MultipartFile.fromBytes(
          firstroomPhoto,
          filename: 'photo2.jpg', // Specify the filename if needed
        ),
        "Roomphoto2": MultipartFile.fromBytes(
          secondRoomPhoto,
          filename: 'photo3.jpg', // Specify the filename if needed
        ),
        "Roomphoto3": MultipartFile.fromBytes(
          thirdRoomPhoto,
          filename: 'photo4.jpg', // Specify the filename if needed
        ),
        "food": hotelModel.food,
        "service": hotelModel.service,
        "comforts": hotelModel.comforts,
        "safe": hotelModel.safe,
        "Rate": hotelModel.rate,
        "nameOfCountry": hotelModel.contrey!.name,
      });
      await apiService.post(endPoint: "inputHotelInformation", body: formData);

      return right("success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> deleteHotel({required int id}) async {
    try {
      var data =
          await apiService.post(endPoint: "DropHotel", body: {"IdHotel": id});

      return right(data["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<HotelModel>>> getHotels() async {
    try {
      var data = await apiService.get(
        endPoint: "gethotels",
      );
      List<HotelModel> hotels = [];
      for (var hotel in data["data"]) {
        hotels.add(HotelModel.fromJson(hotel));
      }
      return right(hotels);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, String>> updateHotel(
      {HotelModel? hotelModel,
      Uint8List? basephoto,
      Uint8List? firstroomPhoto,
      Uint8List? secondRoomPhoto,
      Uint8List? thirdRoomPhoto}) async {
    try {
      FormData formData = FormData.fromMap({
        "IdOfHotel": hotelModel?.id,
        "name": hotelModel?.name,
        "location": hotelModel?.location,
        "description": hotelModel?.description,
        "food": hotelModel?.food,
        "service": hotelModel?.service,
        "comforts": hotelModel?.comforts,
        "safe": hotelModel?.safe,
        "Rate": hotelModel?.rate,
        "nameOfCountry": hotelModel?.contrey?.name,
        "Basicphoto": basephoto == null
            ? null
            : MultipartFile.fromBytes(
                basephoto,
                filename: 'photo1.jpg', // Specify the filename if needed
              ),
        "Roomphoto1": firstroomPhoto == null
            ? null
            : MultipartFile.fromBytes(
                firstroomPhoto,
                filename: 'photo2.jpg', // Specify the filename if needed
              ),
        "Roomphoto2": secondRoomPhoto == null
            ? null
            : MultipartFile.fromBytes(
                secondRoomPhoto,
                filename: 'photo3.jpg', // Specify the filename if needed
              ),
        "Roomphoto3": thirdRoomPhoto == null
            ? null
            : MultipartFile.fromBytes(
                thirdRoomPhoto,
                filename: 'photo4.jpg', // Specify the filename if needed
              ),
      });
      await apiService.post(endPoint: "updateHotel", body: formData);
      return right("success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
