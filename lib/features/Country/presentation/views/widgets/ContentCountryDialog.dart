import 'package:flutter/material.dart';
import 'package:tourism_app/core/widgets/ExpantionListRate.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';
import 'package:tourism_app/core/widgets/SelectImage.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/EditCountryCubit/edit_country_cubit.dart';
import '../../../../../core/widgets/CustomCountryPicker.dart';

class ContentAddCountryDialog extends StatefulWidget {
  const ContentAddCountryDialog(
      {super.key,
      this.countryModel,
      required this.nameController,
      required this.rateController,
      required this.formkey,
      this.isFailure = false});
  final ContryModel? countryModel;
  final TextEditingController nameController;
  final TextEditingController rateController;
  final GlobalKey<FormState> formkey;
  final bool isFailure;

  @override
  State<ContentAddCountryDialog> createState() =>
      _ContentAddCountryDialogState();
}

class _ContentAddCountryDialogState extends State<ContentAddCountryDialog> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: SizedBox(
        width: 500,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                child: SelectImage(
                  photo: widget.countryModel?.photo,
                  onPhotoSelected: (value) => EditCountryCubit.photo = value,
                ),
              ),
              Visibility(
                  visible: widget.isFailure,
                  child: const Text(
                    "Photo is required",
                    style: TextStyle(color: Colors.red),
                  )),
              const SizedBox(height: 24),
              CustomCountryPicker(
                countrycontroller: widget.nameController,
              ),
              const SizedBox(height: 8),
              StarsRatingBar(
                rateController: widget.rateController,
                label: "Country Rate",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
