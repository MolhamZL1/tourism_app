import 'package:flutter/material.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/models/airPlaneCompanyModel.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/views/widget/RatesCompaniesDialog.dart';
import 'package:tourism_app/core/widgets/SelectImage.dart';

class ContentAddCompanyDialog extends StatelessWidget {
  ContentAddCompanyDialog({
    super.key,
    required this.formKey,
    this.companyModel,
    required this.nameController,
    required this.rateController,
    required this.foodRateController,
    required this.comfortRateController,
    required this.safeRateController,
    required this.serviceRateController,
    required this.descriptionController,
    required this.locationController,
  });

  final GlobalKey<FormState> formKey;
  AirPlaneCompanyModel? companyModel;
  final TextEditingController nameController;
  final TextEditingController rateController;
  final TextEditingController foodRateController;
  final TextEditingController comfortRateController;
  final TextEditingController safeRateController;
  final TextEditingController serviceRateController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;

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
              //////desktop layout
              ? Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SelectImage(
                        photo: companyModel?.photo,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 12, left: 45),
                          child: SingleChildScrollView(
                            child: RatesCompaniesDialog(
                                descriptionController: descriptionController,
                                locationController: locationController,
                                nameController: nameController,
                                rateController: rateController,
                                foodRateController: foodRateController,
                                comfortRateController: comfortRateController,
                                safeRateController: safeRateController,
                                serviceRateController: serviceRateController),
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
                        photo: companyModel?.photo,
                      ),
                    ),
                    RatesCompaniesDialog(
                        nameController: nameController,
                        descriptionController: descriptionController,
                        locationController: locationController,
                        rateController: rateController,
                        foodRateController: foodRateController,
                        comfortRateController: comfortRateController,
                        safeRateController: safeRateController,
                        serviceRateController: serviceRateController),
                  ],
                ),
        ),
      ),
    );
  }
}
