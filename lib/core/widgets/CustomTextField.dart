import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      required this.labelText,
      this.keyboardType,
      this.maxLines = 1,
      this.icon,
      this.onChanged,
      this.isPassword = false});
  final TextEditingController? controller;
  final String labelText;
  final int maxLines;
  final TextInputType? keyboardType;
  final IconData? icon;
  final Function(String)? onChanged;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: widget.isPassword ? isObsecure : false,
        inputFormatters: widget.keyboardType != null
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        maxLines: widget.maxLines,
        validator: (value) =>
            value!.isEmpty ? "Enter the ${widget.labelText}" : null,
        cursorColor: kColor,
        decoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              widget.icon,
              color: Colors.grey,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    onPressed: () =>
                        setState(() => isObsecure = isObsecure ? false : true),
                    icon: Icon(
                        isObsecure
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        size: 18))
                : null,
            labelText: widget.labelText,
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
