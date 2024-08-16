import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class CustomCountryPicker extends StatefulWidget {
  const CustomCountryPicker({super.key, required this.countrycontroller});
  final TextEditingController countrycontroller;
  @override
  State<CustomCountryPicker> createState() => _CustomCountryPickerState();
}

class _CustomCountryPickerState extends State<CustomCountryPicker> {
  @override
  Widget build(BuildContext context) {
    return CSCPicker(
      showCities: false,
      showStates: false,
      countryDropdownLabel: widget.countrycontroller.text == ""
          ? "Country"
          : widget.countrycontroller.text,
      onCountryChanged: (value) {
        setState(() {
          widget.countrycontroller.text = value;
        });
      },
    );
  }
}
