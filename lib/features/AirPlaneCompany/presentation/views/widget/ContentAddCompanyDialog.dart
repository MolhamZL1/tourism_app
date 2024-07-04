import 'package:flutter/material.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/models/airPlaneCompanyModel.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/edit_company_cubit/edit_company_cubit.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/views/widget/RatesCompaniesDialog.dart';
import 'package:tourism_app/core/widgets/SelectImage.dart';

class ContentAddCompanyDialog extends StatelessWidget {
  const ContentAddCompanyDialog({
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
    this.isFailure = false,
    required this.countryController,
  });

  final GlobalKey<FormState> formKey;
  final AirPlaneCompanyModel? companyModel;
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
    return Form(
      key: formKey,
      child: SizedBox(
        width: 700,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: MediaQuery.of(context).size.width > 900
              ? _buildDesktopLayout()
              : _buildMobileLayout(),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: isFailure,
          child: const Text(
            "Photo is required",
            style: TextStyle(color: Colors.red),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: SelectImage(
                  photo: companyModel?.photo,
                  onPhotoSelected: (value) {
                    EditCompanyCubit.photo = value;
                  },
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
                      serviceRateController: serviceRateController,
                      countryController: countryController,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return ListView(
      children: [
        SizedBox(
          height: 200,
          child: SelectImage(
            photo: companyModel?.photo,
            onPhotoSelected: (value) {
              EditCompanyCubit.photo = value;
            },
          ),
        ),
        Visibility(
          visible: isFailure,
          child: const Text(
            "Photo is required",
            style: TextStyle(color: Colors.red),
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
          serviceRateController: serviceRateController,
          countryController: countryController,
        ),
      ],
    );
  }
}
