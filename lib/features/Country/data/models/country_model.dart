class ContryModel {
  String? photo;
  String? rate;
  String? name;
  int? id;

  ContryModel({this.id, this.photo, this.rate, this.name});

  factory ContryModel.fromJson(Map<String, dynamic> json) {
    return ContryModel(
      photo: json["photo"],
      rate: json["Rate"],
      name: json["name"],
      id: json["id"],
    );
  }
}
