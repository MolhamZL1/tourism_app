import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/widgets/CustomExpantionListTile.dart';
import 'package:tourism_app/core/widgets/CustomTextField.dart';
import 'package:tourism_app/core/widgets/custom_circle_loading.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/companies_cubit/companies_cubit.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/CountryCubit/country_cubit.dart';
import 'package:tourism_app/features/Trips/data/models/trip_model.dart';
import 'package:tourism_app/features/Trips/presentation/viewModels/books_cubit/books_cubit_cubit.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/UsersList.dart';

class ContentAddTripDialog extends StatefulWidget {
  const ContentAddTripDialog(
      {super.key,
      required this.placeController,
      required this.priceController,
      required this.amountPeopleController,
      required this.timeController,
      required this.companyAilLinesController,
      required this.countryController,
      this.tripModel,
      this.errMessage,
      required this.formKey});
  final TextEditingController placeController;
  final TripModel? tripModel;
  final TextEditingController priceController;
  final TextEditingController amountPeopleController;
  final TextEditingController timeController;
  final TextEditingController companyAilLinesController;
  final TextEditingController countryController;
  final GlobalKey<FormState> formKey;
  final String? errMessage;

  @override
  State<ContentAddTripDialog> createState() => _ContentAddTripDialogState();
}

class _ContentAddTripDialogState extends State<ContentAddTripDialog> {
  DateTime selectedDate = DateTime.now();
  @override
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SizedBox(
        width: 700,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: ListView(
            children: [
              Visibility(
                visible: widget.tripModel != null,
                child: BlocBuilder<BooksCubitCubit, BooksCubitState>(
                  builder: (context, state) {
                    return state is BooksCubitSuccess
                        ? state.books.isEmpty
                            ? FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/undraw_in_no_time_6igu.png",
                                      height: 100,
                                    ),
                                    const Text("No Books Yet!",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.red)),
                                  ],
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Books on this Trip(${state.books.length})",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.grey)),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child:
                                        UsersList(dataUserModel: state.books),
                                  ),
                                ],
                              )
                        : state is BooksCubitLoading
                            ? const CustomCircleLoading(color: kColor)
                            : state is BooksCubitFailure
                                ? FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "images/undraw_in_no_time_6igu.png",
                                          height: 100,
                                        ),
                                        const Text("No Books Yet!",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.red)),
                                      ],
                                    ),
                                  )
                                : const SizedBox();
                  },
                ),
              ),
              Visibility(
                  visible: widget.errMessage != null,
                  child: Text(
                    widget.errMessage ?? "",
                    style: const TextStyle(color: Colors.red),
                  )),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: widget.placeController,
                      labelText: "Place",
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(DateFormatter.formatDateTime(
                      dateTime: selectedDate, outputFormat: "yyyy/MM/dd")),
                  IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: () async {
                      final DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(3000));
                      if (dateTime != null) {
                        widget.timeController.text = dateTime.toString();
                        setState(() {
                          selectedDate = dateTime;
                        });
                      }
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: widget.amountPeopleController,
                      keyboardType: TextInputType.number,
                      labelText: "Amount People",
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                      controller: widget.priceController,
                      keyboardType: TextInputType.number,
                      labelText: "Price " r"$",
                    ),
                  ),
                ],
              ),
              CustomExpantionListTile(
                  controller: widget.countryController,
                  list: CountryCubit.bloccountriesNames,
                  label: "Country"),
              CustomExpantionListTile(
                  controller: widget.companyAilLinesController,
                  list: CompaniesCubit.bloccompaniesNames,
                  label: "AirLine"),
            ],
          ),
        ),
      ),
    );
  }
}
