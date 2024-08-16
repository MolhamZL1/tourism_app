import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.dropdownvalue,
    required this.onChanged,
  });

  final String dropdownvalue;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(.5))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          padding: EdgeInsets.zero,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
          dropdownColor: Colors.white,
          icon: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(Icons.keyboard_arrow_down),
          ),
          value: dropdownvalue,
          items: const [
            DropdownMenuItem(value: "Dayly", child: Text("Dayly")),
            DropdownMenuItem(value: "Weekly", child: Text("Weekly")),
            DropdownMenuItem(value: "Monthly", child: Text("Monthly")),
            DropdownMenuItem(value: "Yearly", child: Text("Yearly")),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}
