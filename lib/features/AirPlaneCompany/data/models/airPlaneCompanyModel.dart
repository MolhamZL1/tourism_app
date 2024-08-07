import 'package:tourism_app/features/Country/data/models/country_model.dart';

class AirPlaneCompanyModel {
  final String name;
  final int id;
  final String description;
  final String location;
  final String photo;
  final String rate;
  final String food;
  final String service;
  final String comforts;
  final String safe;
  final ContryModel country;

  AirPlaneCompanyModel(
      {required this.name,
      required this.food,
      required this.service,
      required this.comforts,
      required this.safe,
      required this.photo,
      required this.rate,
      required this.id,
      required this.description,
      required this.location,
      required this.country});

  factory AirPlaneCompanyModel.fromJson(Map<String, dynamic> json) {
    return AirPlaneCompanyModel(
      country: ContryModel.fromJson(json['contrey']),
      name: json["name"],
      id: json["id"],
      description: json["description"],
      location: json["location"],
      photo: json["photo"],
      rate: json["Rate"],
      food: json["food"],
      service: json["service"],
      comforts: json["Comforts"],
      safe: json["safe"],
    );
  }
}
