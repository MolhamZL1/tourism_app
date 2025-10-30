class DataUserModel {
  final String? firstName;
  final String? lastName;
  final String? photo;
  final String? phoneNumber;
  final String? email;

  const DataUserModel(
      {this.firstName,
      this.lastName,
      this.photo,
      this.phoneNumber,
      this.email});
  factory DataUserModel.fromJson(Map<String, dynamic> json) {
    return DataUserModel(
        firstName: json["Firstname"],
        lastName: json["Lastname"],
        photo: json["visaphoto"],
        phoneNumber: json["phone"],
        email: json["email"]);
  }
}
