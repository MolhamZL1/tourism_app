import 'package:flutter/material.dart';
import '../../../data/models/user_model/user_model.dart';
import 'CustomRowTaple.dart';
import 'TitlesRowTable.dart';

class CustomUsersTable extends StatelessWidget {
  const CustomUsersTable({
    super.key,
    required this.users,
  });
  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 64),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const TitlesRowTable(),
          ...List.generate(
            users.length,
            (index) => CustomRowTaple(userModel: users[index]),
          )
        ],
      ),
    );
  }
}
