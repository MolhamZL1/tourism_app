import 'package:flutter/material.dart';
import 'package:tourism_app/features/Resturants/data/models/resturant_model/resturant_model.dart';
import 'package:tourism_app/features/Resturants/presentation/views/widgets/mobile_resturant_dialog.dart';

import 'desktop_resturant_dialog.dart';

class ContentAddResturantDialog extends StatelessWidget {
  const ContentAddResturantDialog({
    super.key,
    required this.formKey,
    this.resturantModel,
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
    required this.openingHoursController,
    required this.closingHourController,
    required this.phoneController,
    required this.xController,
    required this.yController,
  });

  final GlobalKey<FormState> formKey;
  final ResturantModel? resturantModel;
  final TextEditingController nameController;
  final TextEditingController rateController;
  final TextEditingController foodRateController;
  final TextEditingController comfortRateController;
  final TextEditingController safeRateController;
  final TextEditingController serviceRateController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;
  final TextEditingController countryController;
  final TextEditingController openingHoursController;
  final TextEditingController closingHourController;
  final TextEditingController phoneController;
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
              ? DesktoplayoutResturant(
                  comfortRateController: comfortRateController,
                  countryController: countryController,
                  descriptionController: descriptionController,
                  foodRateController: foodRateController,
                  nameController: nameController,
                  locationController: locationController,
                  rateController: rateController,
                  safeRateController: safeRateController,
                  serviceRateController: serviceRateController,
                  resturantModel: resturantModel,
                  closingHourController: closingHourController,
                  openingHoursController: openingHoursController,
                  phoneController: phoneController,
                  isFailure: isFailure,
                  xController: xController,
                  yController: yController,
                )
              : MobileLayoutResturant(
                  comfortRateController: comfortRateController,
                  countryController: countryController,
                  descriptionController: descriptionController,
                  foodRateController: foodRateController,
                  nameController: nameController,
                  locationController: locationController,
                  rateController: rateController,
                  safeRateController: safeRateController,
                  serviceRateController: serviceRateController,
                  resturantModel: resturantModel,
                  closingHourController: closingHourController,
                  openingHoursController: openingHoursController,
                  phoneController: phoneController,
                  isFailure: isFailure,
                  xController: xController,
                  yController: yController,
                ),
        ),
      ),
    );
  }
}
