import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/constants,.dart';

class AirplaneAditionItem extends StatelessWidget {
  const AirplaneAditionItem({
    super.key,
    this.ontap,
  });
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kColor)),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Icon(Icons.add, color: kColor),
          ),
        ),
      ),
    );
  }
}
