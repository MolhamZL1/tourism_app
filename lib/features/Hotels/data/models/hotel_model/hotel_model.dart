import 'package:tourism_app/features/Country/data/models/country_model.dart';

class HotelModel {
  final int? id;
  final String? name;
  final String? location;
  final String? description;
  final String? basicphoto;
  final String? firstRoomPhoto;
  final String? secondRoomPhoto;
  final String? thirdRoomPhoto;
  final String? food;
  final String? service;
  final String? comforts;
  final String? safe;
  final String? rate;
  final ContryModel? contrey;
  final String? x;
  final String? y;

  const HotelModel({
    this.id,
    this.name,
    this.location,
    this.description,
    this.basicphoto,
    this.firstRoomPhoto,
    this.secondRoomPhoto,
    this.thirdRoomPhoto,
    this.food,
    this.service,
    this.comforts,
    this.safe,
    this.rate,
    this.contrey,
    this.x,
    this.y,
  });

  factory HotelModel.fromJson(Map<String, dynamic> data) => HotelModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        location: data['location'] as String?,
        description: data['description'] as String?,
        basicphoto: data['Basicphoto'] as String?,
        firstRoomPhoto: data['Roomphoto1'] as String?,
        secondRoomPhoto: data['Roomphoto2'] as String?,
        thirdRoomPhoto: data['Roomphoto3'] as String?,
        food: data['food'] as String?,
        service: data['service'] as String?,
        comforts: data['comforts'] as String?,
        safe: data['safe'] as String?,
        rate: data['Rate'] as String?,
        x: data['x'].toString() as String?,
        y: data['y'].toString() as String?,
        contrey: data['contrey'] == null
            ? null
            : ContryModel.fromJson(data['contrey'] as Map<String, dynamic>),
      );
}
