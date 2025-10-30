import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/utils/service_locator.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/models/airPlaneCompanyModel.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/repos/airPalneCompanyRepo.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/companies_cubit/companies_cubit.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/edit_company_cubit/edit_company_cubit.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/views/widget/ContentAddCompanyDialog.dart';

class CustomAddCompanyDialog extends StatefulWidget {
  const CustomAddCompanyDialog({
    super.key,
    this.companyModel,
    this.viewContext,
  });
  final AirPlaneCompanyModel? companyModel;
  final BuildContext? viewContext;

  @override
  State<CustomAddCompanyDialog> createState() => _CustomAddCompanyDialogState();
}

class _CustomAddCompanyDialogState extends State<CustomAddCompanyDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController foodRateController = TextEditingController();
  final TextEditingController serviceRateController = TextEditingController();
  final TextEditingController comfortRateController = TextEditingController();
  final TextEditingController safeRateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool photoIsNotSelected = false;

  @override
  void initState() {
    super.initState();
    EditCompanyCubit.photo = null;
    if (widget.companyModel != null) {
      nameController.text = widget.companyModel!.name!;
      descriptionController.text = widget.companyModel!.description!;
      locationController.text = widget.companyModel!.location!;
      rateController.text = widget.companyModel!.rate!;
      foodRateController.text = widget.companyModel!.food!;
      serviceRateController.text = widget.companyModel!.service!;
      comfortRateController.text = widget.companyModel!.comforts!;
      safeRateController.text = widget.companyModel!.safe!;
      countryController.text = widget.companyModel!.country!.name ?? "";
    } else {
      rateController.text = "1";
      foodRateController.text = "1";
      serviceRateController.text = "1";
      comfortRateController.text = "1";
      safeRateController.text = "1";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditCompanyCubit(getIt.get<AirPalneCompanyRepo>()),
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          widget.companyModel?.name == null
              ? "Add New Company"
              : widget.companyModel!.name!,
          style: const TextStyle(fontSize: 24),
        ),
        content: ContentAddCompanyDialog(
          formKey: formKey,
          descriptionController: descriptionController,
          locationController: locationController,
          companyModel: widget.companyModel,
          nameController: nameController,
          rateController: rateController,
          foodRateController: foodRateController,
          comfortRateController: comfortRateController,
          safeRateController: safeRateController,
          serviceRateController: serviceRateController,
          isFailure: photoIsNotSelected,
          countryController: countryController,
        ),
        actions: [
          BlocConsumer<EditCompanyCubit, EditCompanyState>(
            listener: (context, state) {
              if (state is EditCompanySuccess) {
                GoRouter.of(context).pop();
                BlocProvider.of<CompaniesCubit>(widget.viewContext!)
                    .getAirPlaneCompanies();
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                          EditCompanyCubit.photo = null;
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 16),
                      state is EditCompanyLoading
                          ? const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: CircularProgressIndicator(color: kColor),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (widget.companyModel == null) {
                                    if (EditCompanyCubit.photo != null) {
                                      BlocProvider.of<EditCompanyCubit>(context)
                                          .addCompany(
                                        name: nameController.text,
                                        rate: rateController.text,
                                        comforts: comfortRateController.text,
                                        description: descriptionController.text,
                                        food: foodRateController.text,
                                        location: locationController.text,
                                        safe: safeRateController.text,
                                        service: serviceRateController.text,
                                        country: countryController.text,
                                      );
                                    } else {
                                      setState(() {
                                        photoIsNotSelected = true;
                                      });
                                    }
                                  } else {
                                    BlocProvider.of<EditCompanyCubit>(context)
                                        .updateCompany(
                                      id: widget.companyModel!.id!,
                                      name: nameController.text,
                                      rate: rateController.text,
                                      comforts: comfortRateController.text,
                                      description: descriptionController.text,
                                      food: foodRateController.text,
                                      location: locationController.text,
                                      safe: safeRateController.text,
                                      service: serviceRateController.text,
                                      country: countryController.text,
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kColor),
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                    ],
                  ),
                  if (state is EditCompanyFailure)
                    Text(
                      state.errMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
