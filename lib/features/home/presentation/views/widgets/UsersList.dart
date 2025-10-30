import 'package:flutter/material.dart';

import '../../../data/models/data_user_model.dart';
import 'UserItemTile.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    super.key,
    required this.dataUserModel,
  });
  final List<DataUserModel> dataUserModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        dataUserModel.length,
        (index) => Container(
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1),
              borderRadius: BorderRadius.circular(16)),
          child: IntrinsicWidth(
            child: UserItemTile(
              userModel: dataUserModel[index],
            ),
          ),
        ),
      ),
    );
  }
}
