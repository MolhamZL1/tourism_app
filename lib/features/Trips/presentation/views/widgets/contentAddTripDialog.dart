import 'package:flutter/material.dart';
import 'package:tourism_app/core/widgets/CustomExpantionListTile.dart';
import 'package:tourism_app/core/widgets/CustomTextField.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/companies_cubit/companies_cubit.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/CountryCubit/country_cubit.dart';
import 'package:tourism_app/features/Trips/data/models/trip_model.dart';

class ContentAddTripDialog extends StatefulWidget {
  ContentAddTripDialog(
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
  TripModel? tripModel;
  final TextEditingController priceController;
  final TextEditingController amountPeopleController;
  final TextEditingController timeController;
  final TextEditingController companyAilLinesController;
  final TextEditingController countryController;
  final GlobalKey<FormState> formKey;
  String? errMessage;

  @override
  State<ContentAddTripDialog> createState() => _ContentAddTripDialogState();
}

class _ContentAddTripDialogState extends State<ContentAddTripDialog> {
  DateTime selectedDate = DateTime.now();
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
                  visible: widget.errMessage != null,
                  child: Text(
                    widget.errMessage ?? "",
                    style: const TextStyle(color: Colors.red),
                  )),
              CustomTextField(
                controller: widget.placeController,
                labelText: "Place",
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
                  )
                ],
              ),
              CustomExpantionListTile(
                  controller: widget.countryController,
                  list: CountryCubit.bloccountries,
                  label: "Country"),
              CustomExpantionListTile(
                  controller: widget.companyAilLinesController,
                  list: CompaniesCubit.bloccompanies,
                  label: "AirLine"),
            ],
          ),
        ),
      ),
    );
  }
}
