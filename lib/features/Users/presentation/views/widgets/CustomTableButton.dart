import 'package:flutter/material.dart';
import '../../../../../core/utils/constants,.dart';

class CustomTableButton extends StatelessWidget {
  const CustomTableButton({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                side: BorderSide(color: kColor))),
        backgroundColor: WidgetStatePropertyAll(Colors.white),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 4,
        ),
        child: Text(
          "Charge",
          style: TextStyle(color: kColor),
        ),
      ),
    );
  }
}
