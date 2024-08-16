import 'package:tourism_app/features/Country/data/models/country_model.dart';

class ResturantModel {
  int? id;
  String? restaurantName;
  String? location;
  String? phoneOfRestaurant;
  String? description;
  String? food;
  String? service;
  String? comforts;
  String? safe;
  String? rate;
  String? openingHours;
  String? closingHours;
  String? photo;
  int? countryId;
  ContryModel? contrey;

  ResturantModel({
    this.id,
    this.restaurantName,
    this.location,
    this.phoneOfRestaurant,
    this.description,
    this.food,
    this.service,
    this.comforts,
    this.safe,
    this.rate,
    this.openingHours,
    this.closingHours,
    this.photo,
    this.countryId,
    this.contrey,
  });

  factory ResturantModel.fromJson(Map<String, dynamic> json) {
    return ResturantModel(
      id: json['id'] as int?,
      restaurantName: json['RestaurantName'] as String?,
      location: json['location'] as String?,
      phoneOfRestaurant: json['PhoneOFRestaurant'] as String?,
      description: json['description'] as String?,
      food: json['food'] as String?,
      service: json['service'] as String?,
      comforts: json['comforts'] as String?,
      safe: json['safe'] as String?,
      rate: json['Rate'] as String?,
      openingHours: json['opening_hours'] as String?,
      closingHours: json['closing_hours'] as String?,
      photo: json['photo'] as String?,
      countryId: json['Country_id'] as int?,
      contrey: json['contrey'] == null
          ? null
          : ContryModel.fromJson(json['contrey'] as Map<String, dynamic>),
    );
  }
}
