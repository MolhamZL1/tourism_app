import 'dart:convert';

class Clients {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;

  Clients({this.id, this.firstname, this.lastname, this.email, this.phone});

  factory Clients.fromMap(Map<String, dynamic> data) => Clients(
        id: data['id'] as int?,
        firstname: data['Firstname'] as String?,
        lastname: data['Lastname'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'Firstname': firstname,
        'Lastname': lastname,
        'email': email,
        'phone': phone,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Clients].
  factory Clients.fromJson(String data) {
    return Clients.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Clients] to a JSON string.
  String toJson() => json.encode(toMap());
}
