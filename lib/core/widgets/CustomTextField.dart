import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.keyboardType,
      this.maxLines = 1});
  final TextEditingController controller;
  final String labelText;
  final int maxLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        inputFormatters: keyboardType != null
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        maxLines: maxLines,
        validator: (value) => value!.isEmpty ? "Enter the $labelText" : null,
        cursorColor: kColor,
        decoration: InputDecoration(
            labelText: labelText,
            focusedBorder: buildfocusedBorder(),
            border: buildborder()),
      ),
    );
  }

  OutlineInputBorder buildborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)));
  }

  OutlineInputBorder buildfocusedBorder() {
    return const OutlineInputBorder(
        borderSide: BorderSide(
          color: kColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)));
  }
}
