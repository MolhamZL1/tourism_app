class CountryModel {
  final String photo;
  final String rate;
  final String name;
  final int id;

  CountryModel(
      {required this.id,
      required this.photo,
      required this.rate,
      required this.name});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      photo: json["photo"],
      rate: json["Rate"],
      name: json["name"],
      id: json["id"],
    );
  }
}
