import 'package:flutter/material.dart';
import 'package:tourism_app/core/widgets/ExpantionListRate.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';
import 'package:tourism_app/core/widgets/CustomTextField.dart';
import 'package:tourism_app/core/widgets/SelectImage.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/EditCountryCubit/edit_country_cubit.dart';

class ContentAddCountryDialog extends StatelessWidget {
  ContentAddCountryDialog(
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
  bool isFailure;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: SizedBox(
        width: 700,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: MediaQuery.of(context).size.width > 900
              //////desktop layout
              ? Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SelectImage(
                          photo: countryModel?.photo,
                          onPhotoSelected: (value) => {
                                EditCountryCubit.photo = value,
                              }),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 12, left: 45),
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: nameController,
                                labelText: "Country Name",
                              ),
                              ExpantionListRate(
                                rateController: rateController,
                                label: "Country Rate",
                              ),
                              Visibility(
                                  visible: isFailure,
                                  child: const Text(
                                    "Photo is required",
                                    style: TextStyle(color: Colors.red),
                                  )),
                            ],
                          )),
                    )
                  ],
                )
              //////mobile layout
              : ListView(
                  children: [
                    SizedBox(
                      height: 200,
                      child: SelectImage(
                        photo: countryModel?.photo,
                        onPhotoSelected: (value) =>
                            //   EditCountryCubit.photo =
                            value,
                      ),
                    ),
                    Visibility(
                        visible: isFailure,
                        child: const Text(
                          "Photo is required",
                          style: TextStyle(color: Colors.red),
                        )),
                    CustomTextField(
                      controller: nameController,
                      labelText: "Country Name",
                    ),
                    ExpantionListRate(
                      rateController: rateController,
                      label: "Country Rate",
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
