import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourism_app/core/functions/customSnackBar.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/EditCountryCubit/edit_country_cubit.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/AddPhotoContainer.dart';

class SelectImage extends StatefulWidget {
  SelectImage({super.key, this.photo});

  String? photo;

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  File? _pickedImage;
  Uint8List? _webImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        memoryImage();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.photo == null
              ? const Expanded(child: AddPhotoContainer())
              : _webImage != null || _pickedImage != null
                  ? kIsWeb
                      ? Expanded(child: Center(child: Image.memory(_webImage!)))
                      : Expanded(
                          child: Center(child: Image.file(_pickedImage!)))
                  : Expanded(
                      child: Center(
                      child: CachedNetworkImage(
                        imageUrl: "${ApiService.baseURL}${widget.photo}",
                        errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                      ),
                    )),
        ],
      ),
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
        String fileName = selected.path.split('/').last;
        FormData formData = FormData.fromMap({
          "file":
              await MultipartFile.fromFile(selected.path, filename: fileName),
        });
        EditCountryCubit.photo = selected;

        setState(() {});
      } else {
        customshowSnackBar(context,
            color: Colors.red, massege: "Photo is required");
      }
    } else if (kIsWeb) {
      XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        final bytes = await image.readAsBytes();
        FormData formData = FormData.fromMap({
          'file': MultipartFile.fromBytes(
            bytes,
            filename: 'image.jpg',
          ),
        });

        //  EditCountryCubit.photo = formData;
        widget.photo = "f";
        setState(() {
          _webImage = bytes;
        });
      } else {
        customshowSnackBar(context,
            color: Colors.red, massege: "Photo is required");
      }
    } else {
      customshowSnackBar(context,
          color: Colors.red, massege: "something went wrong");
    }
  }
}
