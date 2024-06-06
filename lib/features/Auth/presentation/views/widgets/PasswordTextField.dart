import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: 400,
        child: TextFormField(
          controller: widget.controller,
          validator: (value) => value!.isEmpty ? "Enter the Password" : null,
          obscureText: isObsecure,
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(.2),
              suffixIcon: IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  onPressed: () =>
                      setState(() => isObsecure = isObsecure ? false : true),
                  icon: Icon(
                      isObsecure
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      size: 18)),
              suffixIconColor: Colors.white,
              hintText: "Password",
              hintStyle: const TextStyle(color: Colors.white),
              focusedBorder: buildfoucusedborder(),
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

  OutlineInputBorder buildfoucusedborder() {
    return const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(32)));
  }
}
