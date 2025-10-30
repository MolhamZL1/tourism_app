import 'package:flutter/material.dart';
import 'package:tourism_app/core/widgets/CustomExpantionListTile.dart';
import 'package:tourism_app/core/widgets/CustomTextField.dart';
import 'package:tourism_app/core/widgets/ExpantionListRate.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/CountryCubit/country_cubit.dart';

class RatesResturantDialog extends StatefulWidget {
  const RatesResturantDialog({
    super.key,
    required this.nameController,
    required this.rateController,
    required this.foodRateController,
    required this.comfortRateController,
    required this.safeRateController,
    required this.serviceRateController,
    required this.descriptionController,
    required this.locationController,
    required this.countryController,
    required this.openingHoursController,
    required this.closingHourController,
    required this.phoneController,
    required this.xController,
    required this.yController,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;
  final TextEditingController rateController;
  final TextEditingController foodRateController;
  final TextEditingController comfortRateController;
  final TextEditingController safeRateController;
  final TextEditingController serviceRateController;
  final TextEditingController countryController;
  final TextEditingController openingHoursController;
  final TextEditingController closingHourController;
  final TextEditingController phoneController;
  final TextEditingController xController;
  final TextEditingController yController;

  @override
  State<RatesResturantDialog> createState() => _RatesResturantDialogState();
}

class _RatesResturantDialogState extends State<RatesResturantDialog> {
  TimeOfDay selectedClosingDate = TimeOfDay.now();
  TimeOfDay selectedopeningDate = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: widget.nameController,
          labelText: "Resturant Name",
          icon: Icons.restaurant_menu,
        ),
        CustomTextField(
          controller: widget.locationController,
          labelText: "Resturant Location",
          icon: Icons.location_on,
        ),
        CustomTextField(
          controller: widget.xController,
          labelText: "X coordinate on map",
          icon: Icons.map,
        ),
        CustomTextField(
          controller: widget.yController,
          labelText: "Y coordinate on map",
          icon: Icons.map,
        ),
        CustomTextField(
          controller: widget.phoneController,
          labelText: "Resturant Phone",
          keyboardType: TextInputType.number,
          icon: Icons.phone,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(.7)),
              borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(children: [
            const Text("Opening Hour : "),
            Text("${selectedopeningDate.hour}:${selectedopeningDate.minute}"),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.hourglass_bottom),
              onPressed: () async {
                final TimeOfDay? dateTime = await showTimePicker(
                  context: context,
                  initialTime: selectedopeningDate,
                );
                if (dateTime != null) {
                  widget.openingHoursController.text =
                      "${selectedopeningDate.hour}:${selectedopeningDate.minute}";
                  setState(() {
                    selectedopeningDate = dateTime;
                  });
                }
              },
            ),
          ]),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(.7)),
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Row(children: [
            const Text("Closing Hour : "),
            Text("${selectedClosingDate.hour}:${selectedClosingDate.minute}"),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.hourglass_bottom),
              onPressed: () async {
                final TimeOfDay? dateTime = await showTimePicker(
                  context: context,
                  initialTime: selectedClosingDate,
                );
                if (dateTime != null) {
                  widget.closingHourController.text =
                      "${selectedClosingDate.hour}:${selectedClosingDate.minute}";
                  setState(() {
                    selectedClosingDate = dateTime;
                  });
                }
              },
            ),
          ]),
        ),
        CustomExpantionListTile(
            controller: widget.countryController,
            list: CountryCubit.bloccountriesNames,
            label: "Resturant"),
        StarsRatingBar(
          rateController: widget.rateController,
          label: "Resturant Rate",
        ),
        StarsRatingBar(
          rateController: widget.foodRateController,
          label: "Food Rate",
        ),
        StarsRatingBar(
          rateController: widget.comfortRateController,
          label: "Comforte Rate",
        ),
        StarsRatingBar(
          rateController: widget.safeRateController,
          label: "Safety Rate",
        ),
        StarsRatingBar(
          rateController: widget.serviceRateController,
          label: "Service Rate",
        ),
      ],
    );
  }
}
