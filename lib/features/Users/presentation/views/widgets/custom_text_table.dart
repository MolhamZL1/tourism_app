import 'package:flutter/material.dart';

class CustomTextTaple extends StatelessWidget {
  const CustomTextTaple({super.key, required this.text, this.flex = 2});
  final String text;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: const BoxDecoration(
            //  border: Border(right: BorderSide(color: Colors.grey))
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                // overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600),
              )),
        ),
      ),
    );
  }
}
