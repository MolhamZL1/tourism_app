import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: 400,
        child: TextFormField(
          controller: controller,
          validator: (value) => value!.isEmpty ? "Enter the Email" : null,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(.2),
              hintText: "Email",
              hintStyle: const TextStyle(color: Colors.white),
              focusedBorder: buildfocusedBorder(),
              border: buildborder()),
        ),
      ),
    );
  }

  OutlineInputBorder buildborder() {
    return const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(32)));
  }

  OutlineInputBorder buildfocusedBorder() {
    return const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(32)));
  }
}
