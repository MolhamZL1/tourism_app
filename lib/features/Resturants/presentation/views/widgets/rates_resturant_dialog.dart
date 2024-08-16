import 'package:flutter/material.dart';
import 'package:tourism_app/core/widgets/CustomExpantionListTile.dart';
import 'package:tourism_app/core/widgets/CustomTextField.dart';
import 'package:tourism_app/core/widgets/ExpantionListRate.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/CountryCubit/country_cubit.dart';

class RatesResturantDialog extends StatelessWidget {
  const RatesResturantDialog({
    super.key,
    required this.nameController,
    required this.rateController,
    required this.foodRateController,
    required this.comfortRateController,
    required this.safeRateController,
    required this.serviceRateController,
    required this.descriptionController,
    required this.locationController,
    required this.countryController,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;
  final TextEditingController rateController;
  final TextEditingController foodRateController;
  final TextEditingController comfortRateController;
  final TextEditingController safeRateController;
  final TextEditingController serviceRateController;
  final TextEditingController countryController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: nameController,
          labelText: "Resturant Name",
          icon: Icons.restaurant_menu,
        ),
        CustomTextField(
          controller: locationController,
          labelText: "Resturant Location",
          icon: Icons.location_on,
        ),
        CustomExpantionListTile(
            controller: countryController,
            list: CountryCubit.bloccountriesNames,
            label: "Resturant"),
        StarsRatingBar(
          rateController: rateController,
          label: "Resturant Rate",
        ),
        StarsRatingBar(
          rateController: foodRateController,
          label: "Food Rate",
        ),
        StarsRatingBar(
          rateController: comfortRateController,
          label: "Comforte Rate",
        ),
        StarsRatingBar(
          rateController: safeRateController,
          label: "Safety Rate",
        ),
        StarsRatingBar(
          rateController: serviceRateController,
          label: "Service Rate",
        ),
      ],
    );
  }
}
