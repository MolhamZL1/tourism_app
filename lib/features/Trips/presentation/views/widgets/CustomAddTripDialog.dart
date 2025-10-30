import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/utils/service_locator.dart';
import 'package:tourism_app/features/Trips/data/models/trip_model.dart';
import 'package:tourism_app/features/Trips/data/repos/trips_repo.dart';
import 'package:tourism_app/features/Trips/presentation/viewModels/edit_trip_cubit/edit_trip_cubit.dart';
import 'package:tourism_app/features/Trips/presentation/viewModels/tripCubit/trip_cubit.dart';
import 'package:tourism_app/features/Trips/presentation/views/widgets/contentAddTripDialog.dart';

import '../../viewModels/books_cubit/books_cubit_cubit.dart';

class CustomAddTripDialog extends StatefulWidget {
  const CustomAddTripDialog({super.key, this.tripModel, this.viewContext});
  final TripModel? tripModel;
  final BuildContext? viewContext;
  @override
  State<CustomAddTripDialog> createState() => _CustomAddTripDialogState();
}

class _CustomAddTripDialogState extends State<CustomAddTripDialog> {
  String? errMessage;
  final TextEditingController placeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController amountPeopleController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController companyAilLinesController =
      TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    if (widget.tripModel?.tripPlace != null) {
      placeController.text = widget.tripModel!.tripPlace!;
      priceController.text = widget.tripModel!.price.toString();
      amountPeopleController.text = widget.tripModel!.amountPeople.toString();
      timeController.text = widget.tripModel!.timeTrip!;
      companyAilLinesController.text = widget.tripModel!.company!.name!;
      countryController.text = widget.tripModel!.country!.name!;
      placeController.text = widget.tripModel!.tripPlace!;
      priceController.text = widget.tripModel!.price.toString();
      amountPeopleController.text = widget.tripModel!.amountPeople.toString();
      timeController.text = widget.tripModel!.timeTrip!;
      companyAilLinesController.text = widget.tripModel!.company!.name!;
      countryController.text = widget.tripModel!.country!.name!;
      BlocProvider.of<BooksCubitCubit>(context).getTrips(widget.tripModel!.id!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditTripCubit(getIt.get<TripsRepo>()),
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
            widget.tripModel?.tripPlace == null
                ? "Add New Trip"
                : widget.tripModel!.tripPlace!,
            style: const TextStyle(fontSize: 24)),
        content: ContentAddTripDialog(
          placeController: placeController,
          priceController: priceController,
          amountPeopleController: amountPeopleController,
          timeController: timeController,
          companyAilLinesController: companyAilLinesController,
          countryController: countryController,
          formKey: formKey,
          tripModel: widget.tripModel,
        ),
        actions: [
          BlocConsumer<EditTripCubit, EditTripState>(
            listener: (context, state) => state is EditTripSuccess
                ? {
                    GoRouter.of(context).pop(),
                    BlocProvider.of<TripCubit>(widget.viewContext!).getTrips()
                  }
                : null,
            builder: (context, state) {
              return Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Visibility(
                      visible: widget.tripModel?.tripPlace != null,
                      child: TextButton(
                          onPressed: () =>
                              BlocProvider.of<EditTripCubit>(context)
                                  .deleteTrip(id: widget.tripModel!.id!),
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          )),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () => GoRouter.of(context).pop(),
                        child: const Text(
                          "Cancle",
                          style: TextStyle(color: Colors.black),
                        )),
                    const SizedBox(width: 16),
                    state is EditTripLoading
                        ? const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CircularProgressIndicator(color: kColor),
                          )
                        : ElevatedButton(
                            onPressed: () => formKey.currentState!.validate()
                                ? widget.tripModel?.tripPlace == null
                                    ? BlocProvider.of<EditTripCubit>(context)
                                        .addTrip(
                                            price:
                                                int.parse(priceController.text),
                                            amountPeople: int.parse(
                                                amountPeopleController.text),
                                            place: placeController.text,
                                            country: countryController.text,
                                            company:
                                                companyAilLinesController.text,
                                            time: timeController.text)
                                    : BlocProvider.of<EditTripCubit>(context)
                                        .updateTrip(
                                            id: widget.tripModel!.id!,
                                            price:
                                                int.parse(priceController.text),
                                            amountPeople: int.parse(
                                                amountPeopleController.text),
                                            place: placeController.text,
                                            country: countryController.text,
                                            company:
                                                companyAilLinesController.text,
                                            time: timeController.text)
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
                  state is EditTripFailure
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
