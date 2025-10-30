import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/utils/service_locator.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';
import 'package:tourism_app/features/Resturants/data/models/resturant_model/resturant_model.dart';
import 'package:tourism_app/features/Resturants/data/repos/resturant_repo.dart';
import 'package:tourism_app/features/Resturants/presentation/viewModel/EditResturantCubit/edit_resturant_cubit.dart';
import 'package:tourism_app/features/Resturants/presentation/viewModel/ResturantsCubit/resturants_cubit.dart';
import 'package:tourism_app/features/Resturants/presentation/views/widgets/content%20add_resturantDialog.dart';

class CustomAddResturantDialog extends StatefulWidget {
  const CustomAddResturantDialog({
    super.key,
    this.resturantModel,
    this.viewContext,
  });
  final ResturantModel? resturantModel;
  final BuildContext? viewContext;

  @override
  State<CustomAddResturantDialog> createState() =>
      _CustomAddResturantDialogState();
}

class _CustomAddResturantDialogState extends State<CustomAddResturantDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController foodRateController = TextEditingController();
  final TextEditingController serviceRateController = TextEditingController();
  final TextEditingController comfortRateController = TextEditingController();
  final TextEditingController safeRateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController openingHoursController = TextEditingController();
  final TextEditingController closingHourController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController xController = TextEditingController();
  final TextEditingController yController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  bool isFailure = false;

  @override
  void initState() {
    EditResturantCubit.photo = null;

    if (widget.resturantModel != null) {
      nameController.text = widget.resturantModel!.restaurantName!;
      descriptionController.text = widget.resturantModel!.description!;
      locationController.text = widget.resturantModel!.location!;
      countryController.text = widget.resturantModel!.contrey!.name!;
      rateController.text = widget.resturantModel!.rate!;
      foodRateController.text = widget.resturantModel!.food!;
      serviceRateController.text = widget.resturantModel!.service!;
      comfortRateController.text = widget.resturantModel!.comforts!;
      safeRateController.text = widget.resturantModel!.safe!;
      phoneController.text = widget.resturantModel!.phoneOfRestaurant!;
      openingHoursController.text = widget.resturantModel!.openingHours!;
      closingHourController.text = widget.resturantModel!.closingHours!;
      xController.text = widget.resturantModel!.x!;
      yController.text = widget.resturantModel!.y!;
    } else {
      rateController.text = "1";
      foodRateController.text = "1";
      serviceRateController.text = "1";
      comfortRateController.text = "1";
      safeRateController.text = "1";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditResturantCubit(getIt.get<ResturantRepo>()),
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
            widget.resturantModel?.restaurantName == null
                ? "Add New Resturant"
                : widget.resturantModel!.restaurantName!,
            style: const TextStyle(fontSize: 24)),
        content: ContentAddResturantDialog(
          formKey: formKey,
          descriptionController: descriptionController,
          locationController: locationController,
          resturantModel: widget.resturantModel,
          nameController: nameController,
          rateController: rateController,
          foodRateController: foodRateController,
          comfortRateController: comfortRateController,
          safeRateController: safeRateController,
          serviceRateController: serviceRateController,
          isFailure: isFailure,
          countryController: countryController,
          closingHourController: closingHourController,
          openingHoursController: openingHoursController,
          phoneController: phoneController,
          xController: xController,
          yController: yController,
        ),
        actions: [
          BlocConsumer<EditResturantCubit, EditResturantState>(
            listener: (context, state) => state is EditResturantSuccess
                ? {
                    GoRouter.of(context).pop(),
                    BlocProvider.of<ResturantsCubit>(widget.viewContext!)
                        .getResturants()
                  }
                : null,
            builder: (context, state) {
              return Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Visibility(
                      visible: widget.resturantModel?.restaurantName != null,
                      child: TextButton(
                          onPressed: () =>
                              BlocProvider.of<EditResturantCubit>(context)
                                  .deleteResturant(
                                      id: widget.resturantModel!.id!),
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          )),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () => {
                              GoRouter.of(context).pop(),
                              EditResturantCubit.photo = null,
                            },
                        child: const Text(
                          "Cancle",
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(width: 16),
                    state is EditResturantLoading
                        ? const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CircularProgressIndicator(color: kColor),
                          )
                        : ElevatedButton(
                            onPressed: () => formKey.currentState!.validate()
                                ? widget.resturantModel == null
                                    ? EditResturantCubit.photo != null
                                        ? BlocProvider.of<EditResturantCubit>(context).addResturant(
                                            resturantModel: ResturantModel(
                                                restaurantName:
                                                    nameController.text,
                                                rate: rateController.text,
                                                comforts:
                                                    comfortRateController.text,
                                                description:
                                                    descriptionController.text,
                                                food: foodRateController.text,
                                                location:
                                                    locationController.text,
                                                safe: safeRateController.text,
                                                service:
                                                    serviceRateController.text,
                                                closingHours:
                                                    closingHourController.text,
                                                openingHours:
                                                    openingHoursController.text,
                                                phoneOfRestaurant:
                                                    phoneController.text,
                                                x: xController.text,
                                                y: yController.text,
                                                contrey: ContryModel(
                                                    name: countryController
                                                        .text)))
                                        : setState(() {
                                            isFailure = true;
                                          })
                                    : BlocProvider.of<EditResturantCubit>(context).updateResturant(
                                        resturantModel: ResturantModel(
                                            id: widget.resturantModel!.id,
                                            restaurantName: nameController.text,
                                            rate: rateController.text,
                                            comforts:
                                                comfortRateController.text,
                                            description:
                                                descriptionController.text,
                                            food: foodRateController.text,
                                            location: locationController.text,
                                            safe: safeRateController.text,
                                            service: serviceRateController.text,
                                            closingHours:
                                                closingHourController.text,
                                            openingHours:
                                                openingHoursController.text,
                                            phoneOfRestaurant: phoneController.text,
                                            x: xController.text,
                                            y: yController.text,
                                            contrey: ContryModel(name: countryController.text)))
                                : null,
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(kColor)),
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ]),
                  state is EditResturantFailure
                      ? SizedBox(
                          child: Text(
                            state.errMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        )
                      : const SizedBox(),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
