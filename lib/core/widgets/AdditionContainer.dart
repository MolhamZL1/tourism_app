import 'package:flutter/material.dart';

class AdditionContainer extends StatelessWidget {
  const AdditionContainer({
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
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey)),
        child: const Center(
          child: Icon(Icons.add, color: Colors.grey),
        ),
      ),
    );
  }
}
