import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/constants,.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.circular = 32,
  });
  final String text;
  final VoidCallback? onTap;
  final bool isLoading;
  final double circular;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 400,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: kColor, borderRadius: BorderRadius.circular(circular)),
        height: 55,
        child: Center(
          child: isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : Text(
                  text,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
        ),
      ),
    );
  }
}
