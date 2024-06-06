import 'package:flutter/material.dart';
import 'package:tourism_app/core/widgets/ExpantionListRate.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';
import 'package:tourism_app/core/widgets/CustomTextField.dart';
import 'package:tourism_app/core/widgets/SelectImage.dart';

class ContentAddCountryDialog extends StatefulWidget {
  const ContentAddCountryDialog({
    super.key,
    this.countryModel,
    required this.nameController,
    required this.rateController,
    required this.formkey,
  });
  final CountryModel? countryModel;
  final TextEditingController nameController;
  final TextEditingController rateController;
  final GlobalKey<FormState> formkey;

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
                        photo: widget.countryModel?.photo,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 12, left: 45),
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: widget.nameController,
                                labelText: "Country Name",
                              ),
                              ExpantionListRate(
                                rateController: widget.rateController,
                                label: "Country Rate",
                              ),
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
                        photo: widget.countryModel?.photo,
                      ),
                    ),
                    CustomTextField(
                      controller: widget.nameController,
                      labelText: "Country Name",
                    ),
                    ExpantionListRate(
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
