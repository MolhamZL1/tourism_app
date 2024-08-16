import 'package:flutter/material.dart';
import 'package:tourism_app/core/widgets/CustomExpantionListTile.dart';
import 'package:tourism_app/core/widgets/CustomTextField.dart';
import 'package:tourism_app/core/widgets/ExpantionListRate.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/CountryCubit/country_cubit.dart';

class RatesHotelsDialog extends StatelessWidget {
  const RatesHotelsDialog({
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
          labelText: "Hotel Name",
          icon: Icons.hotel,
        ),
        CustomTextField(
          controller: locationController,
          labelText: "Hotel Location",
          icon: Icons.location_on,
        ),
        CustomExpantionListTile(
            controller: countryController,
            list: CountryCubit.bloccountriesNames,
            label: "Hotel"),
        CustomTextField(
          controller: descriptionController,
          labelText: "Hotel Description",
          maxLines: 5,
          icon: Icons.description,
        ),
        StarsRatingBar(
          rateController: rateController,
          label: "Hotel Rate",
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
