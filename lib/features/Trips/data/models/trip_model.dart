import 'package:tourism_app/features/AirPlaneCompany/data/models/airPlaneCompanyModel.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';

class TripModel {
  final int id;
  final String tripPlace;
  final String timeTrip;
  final int price;
  final CountryModel country;
  final int amountPeople;
  final AirPlaneCompanyModel company;

  const TripModel({
    required this.amountPeople,
    required this.id,
    required this.tripPlace,
    required this.timeTrip,
    required this.price,
    required this.country,
    required this.company,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
        amountPeople: json['amountpeople'],
        id: json['id'],
        tripPlace: json['TripPlace'],
        timeTrip: json['TimeTrip'],
        price: json['Price'],
        country: CountryModel.fromJson(json['country']),
        company: AirPlaneCompanyModel.fromJson(json['company']),
      );
}
