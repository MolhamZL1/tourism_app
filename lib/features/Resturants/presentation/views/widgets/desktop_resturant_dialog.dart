import 'package:flutter/material.dart';
import 'package:tourism_app/features/Resturants/data/models/resturant_model/resturant_model.dart';
import 'package:tourism_app/features/Resturants/presentation/viewModel/EditResturantCubit/edit_resturant_cubit.dart';
import 'package:tourism_app/features/Resturants/presentation/views/widgets/rates_resturant_dialog.dart';

import '../../../../../core/widgets/CustomTextField.dart';
import '../../../../../core/widgets/SelectImage.dart';

class DesktoplayoutResturant extends StatelessWidget {
  const DesktoplayoutResturant(
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
      required this.isFailure});
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
  final bool isFailure;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: isFailure,
                child: const Text(
                  "Image is required",
                  style: TextStyle(color: Colors.red),
                ),
              ),
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
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 45),
            child: SingleChildScrollView(
              child: RatesResturantDialog(
                descriptionController: descriptionController,
                locationController: locationController,
                nameController: nameController,
                rateController: rateController,
                foodRateController: foodRateController,
                comfortRateController: comfortRateController,
                safeRateController: safeRateController,
                serviceRateController: serviceRateController,
                countryController: countryController,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
