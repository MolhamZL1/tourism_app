import 'package:flutter/material.dart';
import 'package:tourism_app/features/Hotels/data/models/hotel_model/hotel_model.dart';
import 'package:tourism_app/features/Hotels/presentation/views/widgets/mobileLayoutHotel.dart';

import 'desktopLayoutHotel.dart';

class ContentAddHotelDialog extends StatelessWidget {
  const ContentAddHotelDialog({
    super.key,
    required this.formKey,
    this.hotelModel,
    required this.nameController,
    required this.rateController,
    required this.foodRateController,
    required this.comfortRateController,
    required this.safeRateController,
    required this.serviceRateController,
    required this.descriptionController,
    required this.locationController,
    this.isFailure = false,
    required this.countryController,
    required this.xController,
    required this.yController,
  });

  final GlobalKey<FormState> formKey;
  final HotelModel? hotelModel;
  final TextEditingController nameController;
  final TextEditingController rateController;
  final TextEditingController foodRateController;
  final TextEditingController comfortRateController;
  final TextEditingController safeRateController;
  final TextEditingController serviceRateController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;
  final TextEditingController countryController;
  final TextEditingController xController;
  final TextEditingController yController;

  final bool isFailure;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: 700,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: MediaQuery.of(context).size.width > 900
              ? DesktoplayoutHotel(
                  comfortRateController: comfortRateController,
                  countryController: countryController,
                  descriptionController: descriptionController,
                  foodRateController: foodRateController,
                  nameController: nameController,
                  locationController: locationController,
                  rateController: rateController,
                  safeRateController: safeRateController,
                  serviceRateController: serviceRateController,
                  hotelModel: hotelModel,
                  isFailure: isFailure,
                  xController: xController,
                  yController: yController,
                )
              : MobileLayoutHotel(
                  comfortRateController: comfortRateController,
                  countryController: countryController,
                  descriptionController: descriptionController,
                  foodRateController: foodRateController,
                  nameController: nameController,
                  locationController: locationController,
                  rateController: rateController,
                  safeRateController: safeRateController,
                  serviceRateController: serviceRateController,
                  hotelModel: hotelModel,
                  isFailure: isFailure,
                  xController: xController,
                  yController: yController,
                ),
        ),
      ),
    );
  }
}
