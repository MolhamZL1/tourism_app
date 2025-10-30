import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../data/models/data_user_model.dart';

class UserItemTile extends StatelessWidget {
  const UserItemTile({
    super.key,
    required this.userModel,
  });
  final DataUserModel userModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${userModel.firstName!} ${userModel.lastName!}"),
      subtitle: Text(userModel.email!),
      leading: Container(
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                    "${ApiService.baseURL}" "${userModel.photo!}")),
            color: Colors.white),
      ),
    );
  }
}
