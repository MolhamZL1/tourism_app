import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/constants,.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool ischecked = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: ischecked,
          onChanged: (value) =>
              setState(() => ischecked = ischecked ? false : true),
          activeColor: kColor,
          checkColor: Colors.white,
          side: const BorderSide(color: kColor),
        ),
        const Text(
          "Remember me",
          style: TextStyle(color: kColor),
        ),
      ],
    );
  }
}
