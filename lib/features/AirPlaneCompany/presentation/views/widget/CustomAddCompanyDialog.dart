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
  });
  final AirPlaneCompanyModel? companyModel;

  @override
  State<CustomAddCompanyDialog> createState() => _CustomAddCompanyDialogState();
}

class _CustomAddCompanyDialogState extends State<CustomAddCompanyDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController foodRateController = TextEditingController();
  final TextEditingController serviceRateController = TextEditingController();
  final TextEditingController comfortRateController = TextEditingController();
  final TextEditingController safeRateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    nameController.text =
        widget.companyModel?.name == null ? "" : widget.companyModel!.name;
    descriptionController.text = widget.companyModel?.description == null
        ? ""
        : widget.companyModel!.description;
    locationController.text = widget.companyModel?.location == null
        ? ""
        : widget.companyModel!.location;
    rateController.text =
        widget.companyModel?.rate == null ? "Low" : widget.companyModel!.rate;
    foodRateController.text =
        widget.companyModel?.food == null ? "Low" : widget.companyModel!.food;
    serviceRateController.text = widget.companyModel?.service == null
        ? "Low"
        : widget.companyModel!.service;
    comfortRateController.text = widget.companyModel?.comforts == null
        ? "Low"
        : widget.companyModel!.comforts;
    safeRateController.text =
        widget.companyModel?.safe == null ? "Low" : widget.companyModel!.safe;

    super.initState();
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
                : widget.companyModel!.name,
            style: const TextStyle(fontSize: 24)),
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
            serviceRateController: serviceRateController),
        actions: [
          BlocConsumer<EditCompanyCubit, EditCompanyState>(
            listener: (context, state) => state is EditCompanySuccess
                ? {
                    GoRouter.of(context).pop(),
                    BlocProvider.of<CompaniesCubit>(context)
                        .getAirPlaneCompanies()
                  }
                : null,
            builder: (context, state) {
              return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Visibility(
                  visible: widget.companyModel?.name != null,
                  child: TextButton(
                      onPressed: () =>
                          BlocProvider.of<EditCompanyCubit>(context)
                              .deleteCompany(id: widget.companyModel!.id),
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      )),
                ),
                const Spacer(),
                state is EditCompanyFailure
                    ? Text(
                        state.errMessage,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                TextButton(
                    onPressed: () => GoRouter.of(context).pop(),
                    child: const Text(
                      "Cancle",
                      style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(width: 16),
                state is EditCompanyLoading
                    ? const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: CircularProgressIndicator(color: kColor),
                      )
                    : ElevatedButton(
                        onPressed: () =>
                            formKey.currentState!.validate() ? null : null,
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(kColor)),
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ]);
            },
          )
        ],
      ),
    );
  }
}
