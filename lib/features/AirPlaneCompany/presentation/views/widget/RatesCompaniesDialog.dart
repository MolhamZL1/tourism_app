import 'package:flutter/material.dart';
import 'package:tourism_app/core/widgets/CustomExpantionListTile.dart';
import 'package:tourism_app/core/widgets/CustomTextField.dart';
import 'package:tourism_app/core/widgets/ExpantionListRate.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/CountryCubit/country_cubit.dart';

class RatesCompaniesDialog extends StatelessWidget {
  const RatesCompaniesDialog({
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
          labelText: "Company Name",
        ),
        CustomTextField(
          controller: locationController,
          labelText: "Company Location",
        ),
        CustomExpantionListTile(
            controller: countryController,
            list: CountryCubit.bloccountries,
            label: "Country"),
        CustomTextField(
          controller: descriptionController,
          labelText: "Company Description",
          maxLines: 5,
        ),
        ExpantionListRate(
          rateController: rateController,
          label: "Company Rate",
        ),
        ExpantionListRate(
          rateController: foodRateController,
          label: "Food Rate",
        ),
        ExpantionListRate(
          rateController: comfortRateController,
          label: "Comforte Rate",
        ),
        ExpantionListRate(
          rateController: safeRateController,
          label: "Safety Rate",
        ),
        ExpantionListRate(
          rateController: serviceRateController,
          label: "Service Rate",
        ),
      ],
    );
  }
}
