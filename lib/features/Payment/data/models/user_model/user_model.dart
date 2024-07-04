import 'dart:convert';

import 'clients.dart';

class UserModel {
  int? id;
  int? balance;
  String? lastTransactionDate;
  int? userId;
  Clients? clients;

  UserModel({
    this.id,
    this.balance,
    this.lastTransactionDate,
    this.userId,
    this.clients,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        id: data['id'] as int?,
        balance: data['balance'] as int?,
        lastTransactionDate: data['last_transaction_date'] as String?,
        userId: data['user_id'] as int?,
        clients: data['clients'] == null
            ? null
            : Clients.fromMap(data['clients'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'balance': balance,
        'last_transaction_date': lastTransactionDate,
        'user_id': userId,
        'clients': clients?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
