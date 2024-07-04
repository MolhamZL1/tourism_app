import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/AddPhotoContainer.dart';

class SelectImage extends StatefulWidget {
  const SelectImage({Key? key, this.photo, required this.onPhotoSelected})
      : super(key: key);
  final String? photo;
  final ValueChanged<dynamic> onPhotoSelected;

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  File? _pickedImage;
  Uint8List? _webImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickImage(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildImageWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildImageWidget() {
    if (_webImage != null) {
      return Center(child: Image.memory(_webImage!));
    } else if (_pickedImage != null) {
      return Center(child: Image.file(_pickedImage!));
    } else if (widget.photo != null) {
      return Center(
        child: CachedNetworkImage(
          imageUrl: "${ApiService.baseURL}${widget.photo}",
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
      );
    } else {
      return const AddPhotoContainer();
    }
  }

  Future<void> _pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (kIsWeb) {
        final bytes = await image.readAsBytes();
        setState(() {
          _webImage = bytes;
        });
        widget.onPhotoSelected(bytes);
      } else {
        setState(() {
          _pickedImage = File(image.path);
        });
        widget.onPhotoSelected(_pickedImage);
      }
    }
  }
}
