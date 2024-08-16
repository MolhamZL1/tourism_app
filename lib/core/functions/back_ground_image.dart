import 'package:flutter/material.dart';

BoxDecoration backgroundimage() {
  return const BoxDecoration(
      image: DecorationImage(
    colorFilter: ColorFilter.mode(
      Colors.black26,
      BlendMode.darken,
    ),
    opacity: .7,
    image: AssetImage("images/login.jpg"),
    fit: BoxFit.cover,
  ));
}
