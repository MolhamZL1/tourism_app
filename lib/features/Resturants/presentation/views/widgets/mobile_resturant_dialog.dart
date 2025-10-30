import 'package:flutter/material.dart';
import 'package:tourism_app/features/Resturants/data/models/resturant_model/resturant_model.dart';
import 'package:tourism_app/features/Resturants/presentation/viewModel/EditResturantCubit/edit_resturant_cubit.dart';
import 'package:tourism_app/features/Resturants/presentation/views/widgets/rates_resturant_dialog.dart';

import '../../../../../core/widgets/CustomTextField.dart';
import '../../../../../core/widgets/SelectImage.dart';

class MobileLayoutResturant extends StatelessWidget {
  const MobileLayoutResturant(
      {super.key,
      this.resturantModel,
      required this.nameController,
      required this.rateController,
      required this.foodRateController,
      required this.comfortRateController,
      required this.safeRateController,
      required this.serviceRateController,
      required this.descriptionController,
      required this.locationController,
      required this.countryController,
      required this.isFailure,
      required this.openingHoursController,
      required this.closingHourController,
      required this.phoneController,
      required this.xController,
      required this.yController});
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
    return ListView(
      children: [
        SizedBox(
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Expanded(
                child: SelectImage(
                  photo: resturantModel?.photo,
                  onPhotoSelected: (value) => EditResturantCubit.photo = value,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: CustomTextField(
                  controller: descriptionController,
                  labelText: "Resturant Description",
                  icon: Icons.description,
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: isFailure,
          child: const Text(
            "Images are required",
            style: TextStyle(color: Colors.red),
          ),
        ),
        RatesResturantDialog(
          nameController: nameController,
          xController: xController,
          yController: yController,
          descriptionController: descriptionController,
          locationController: locationController,
          rateController: rateController,
          foodRateController: foodRateController,
          comfortRateController: comfortRateController,
          safeRateController: safeRateController,
          serviceRateController: serviceRateController,
          countryController: countryController,
          closingHourController: closingHourController,
          openingHoursController: openingHoursController,
          phoneController: phoneController,
        ),
      ],
    );
  }
}
