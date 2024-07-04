import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:tourism_app/core/errors/failure.dart';
import 'package:tourism_app/features/Hotels/data/models/hotel_model/hotel_model.dart';

abstract class HotelRepo {
  Future<Either<ServerFailure, List<HotelModel>>> getHotels();

  Future<Either<ServerFailure, String>> addHotel(
      {required HotelModel hotelModel,
      required Uint8List basephoto,
      required Uint8List firstroomPhoto,
      required Uint8List secondRoomPhoto,
      required Uint8List thirdRoomPhoto});

  Future<Either<ServerFailure, String>> deleteHotel({
    required int id,
  });

  Future<Either<ServerFailure, String>> updateHotel(
      {required HotelModel? hotelModel,
      required Uint8List? basephoto,
      required Uint8List? firstroomPhoto,
      required Uint8List? secondRoomPhoto,
      required Uint8List? thirdRoomPhoto});
}
