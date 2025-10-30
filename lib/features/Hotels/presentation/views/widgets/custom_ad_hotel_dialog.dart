import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/utils/service_locator.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';
import 'package:tourism_app/features/Hotels/data/models/hotel_model/hotel_model.dart';
import 'package:tourism_app/features/Hotels/data/repos/hotel_repo.dart';
import 'package:tourism_app/features/Hotels/presentation/viewModel/EditHotelsCubit/edit_hotels_cubit.dart';
import 'package:tourism_app/features/Hotels/presentation/viewModel/HotelsCubit/hotels_cubit.dart';
import 'package:tourism_app/features/Hotels/presentation/views/widgets/contentAddHotelDialog.dart';

class CustomAddHotelDialog extends StatefulWidget {
  const CustomAddHotelDialog({
    super.key,
    this.hotelModel,
    this.viewContext,
  });
  final HotelModel? hotelModel;
  final BuildContext? viewContext;

  @override
  State<CustomAddHotelDialog> createState() => _CustomAddHotelDialogState();
}

class _CustomAddHotelDialogState extends State<CustomAddHotelDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController foodRateController = TextEditingController();
  final TextEditingController serviceRateController = TextEditingController();
  final TextEditingController comfortRateController = TextEditingController();
  final TextEditingController safeRateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController xController = TextEditingController();
  final TextEditingController yController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  bool isFailure = false;

  @override
  void initState() {
    EditHotelsCubit.basephoto = null;
    EditHotelsCubit.firstroomPhoto = null;
    EditHotelsCubit.secondRoomPhoto = null;
    EditHotelsCubit.thirdRoomPhoto = null;
    if (widget.hotelModel != null) {
      nameController.text = widget.hotelModel!.name!;
      descriptionController.text = widget.hotelModel!.description!;
      locationController.text = widget.hotelModel!.location!;
      countryController.text = widget.hotelModel!.contrey!.name!;
      rateController.text = widget.hotelModel!.rate!;
      foodRateController.text = widget.hotelModel!.food!;
      serviceRateController.text = widget.hotelModel!.service!;
      comfortRateController.text = widget.hotelModel!.comforts!;
      safeRateController.text = widget.hotelModel!.safe!;
      xController.text = widget.hotelModel!.x!;
      yController.text = widget.hotelModel!.y!;
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
      create: (context) => EditHotelsCubit(getIt.get<HotelRepo>()),
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
            widget.hotelModel?.name == null
                ? "Add New Hotel"
                : widget.hotelModel!.name!,
            style: const TextStyle(fontSize: 24)),
        content: ContentAddHotelDialog(
          formKey: formKey,
          descriptionController: descriptionController,
          locationController: locationController,
          hotelModel: widget.hotelModel,
          nameController: nameController,
          rateController: rateController,
          foodRateController: foodRateController,
          comfortRateController: comfortRateController,
          safeRateController: safeRateController,
          serviceRateController: serviceRateController,
          isFailure: isFailure,
          countryController: countryController,
          xController: xController,
          yController: yController,
        ),
        actions: [
          BlocConsumer<EditHotelsCubit, EditHotelsState>(
            listener: (context, state) => state is EditHotelsSuccess
                ? {
                    GoRouter.of(context).pop(),
                    BlocProvider.of<HotelsCubit>(widget.viewContext!)
                        .getHotels()
                  }
                : null,
            builder: (context, state) {
              return Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Visibility(
                      visible: widget.hotelModel?.name != null,
                      child: TextButton(
                          onPressed: () =>
                              BlocProvider.of<EditHotelsCubit>(context)
                                  .deleteHotel(id: widget.hotelModel!.id!),
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          )),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () => {
                              GoRouter.of(context).pop(),
                              EditHotelsCubit.basephoto = null,
                              EditHotelsCubit.firstroomPhoto = null,
                              EditHotelsCubit.secondRoomPhoto = null,
                              EditHotelsCubit.thirdRoomPhoto = null,
                            },
                        child: const Text(
                          "Cancle",
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(width: 16),
                    state is EditHotelsLoading
                        ? const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CircularProgressIndicator(color: kColor),
                          )
                        : ElevatedButton(
                            onPressed: () => formKey.currentState!.validate()
                                ? widget.hotelModel == null
                                    ? EditHotelsCubit.basephoto != null &&
                                            EditHotelsCubit.firstroomPhoto !=
                                                null &&
                                            EditHotelsCubit.secondRoomPhoto !=
                                                null &&
                                            EditHotelsCubit.thirdRoomPhoto !=
                                                null
                                        ? BlocProvider.of<EditHotelsCubit>(context).addHotel(
                                            hotelModel: HotelModel(
                                                name: nameController.text,
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
                                                x: xController.text,
                                                y: yController.text,
                                                contrey: ContryModel(
                                                    name: countryController
                                                        .text)))
                                        : setState(() {
                                            isFailure = true;
                                          })
                                    : BlocProvider.of<EditHotelsCubit>(context).updateHotel(
                                        hotelModel: HotelModel(
                                            id: widget.hotelModel!.id,
                                            name: nameController.text,
                                            rate: rateController.text,
                                            comforts:
                                                comfortRateController.text,
                                            description:
                                                descriptionController.text,
                                            food: foodRateController.text,
                                            location: locationController.text,
                                            safe: safeRateController.text,
                                            service: serviceRateController.text,
                                            x: xController.text,
                                            y: yController.text,
                                            contrey: ContryModel(
                                                name: countryController.text)))
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
                  state is EditHotelsFailure
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
