import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/core/functions/pick_image_from_device.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/features/home/presentation/viewmodels/editProfile/edit_profile_cubit.dart';

class SelectProfileImage extends StatefulWidget {
  const SelectProfileImage({super.key, this.photo});
  final String? photo;

  @override
  State<SelectProfileImage> createState() => _SelectProfileImageState();
}

class _SelectProfileImageState extends State<SelectProfileImage> {
  File? _pickedImage;
  Uint8List? _webImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: CircleAvatar(
            radius: 99,
            backgroundColor: kColor,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: _webImage != null || _pickedImage != null
                    ? kIsWeb
                        ? Image.memory(
                            _webImage!,
                            fit: BoxFit.cover,
                          )
                        : Image.file(_pickedImage!)
                    : CachedNetworkImage(
                        imageUrl: "${ApiService.baseURL}${widget.photo}",
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99), color: Colors.grey),
            child: IconButton(
              onPressed: () => pickImage(
                onPhotoSelected: (value) => setState(() {
                  _webImage = value;
                  EditProfileCubit.photo = value;
                }),
              ),
              icon: const Icon(Icons.add_a_photo_outlined),
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
