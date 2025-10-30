import 'package:tourism_app/features/Trips/data/models/trip_model.dart';
import 'package:tourism_app/features/home/data/models/data_user_model.dart';

class Bookmodel {
  final DataUserModel? dataUserModel;
  final TripModel? tripModel;

  const Bookmodel({
    required this.dataUserModel,
    required this.tripModel,
  });
  factory Bookmodel.fromJson(Map<String, dynamic> json) => Bookmodel(
        dataUserModel: DataUserModel.fromJson(json['user']),
        tripModel: TripModel.fromJson(json['trip']),
      );
}
