import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/edit_company_cubit/edit_company_cubit.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/EditCountryCubit/edit_country_cubit.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/AddPhotoContainer.dart';
import 'package:tourism_app/features/home/presentation/viewmodels/editProfile/edit_profile_cubit.dart';

class SelectProfileImage extends StatefulWidget {
  SelectProfileImage({super.key, this.photo, required this.type});

  String? photo;
  String type;

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
              onPressed: () => memoryImage(),
              icon: const Icon(Icons.add_a_photo_outlined),
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Future memoryImage() async {
    if (!kIsWeb) {
      XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        var selected = File(image.path);
        widget.photo = "selected";
        _pickedImage = selected;
        // EditCountryCubit.photo = selected;
        setState(() {});
      } else {}
    } else if (kIsWeb) {
      XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        final bytes = await image.readAsBytes();
        widget.photo = "bytes";
        _webImage = bytes;
        if (widget.type == "country") {
          EditCountryCubit.photo = bytes;
        } else if (widget.type == "company") {
          EditCompanyCubit.photo = bytes;
        } else if (widget.type == "profile") {
          EditProfileCubit.photo = bytes;
        } else {}

        setState(() {});
      } else {}
    } else {}
  }
}
