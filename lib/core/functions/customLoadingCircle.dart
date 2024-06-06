import 'package:flutter/material.dart';

void customshowLoadingCircle(
  BuildContext context,
) {
  showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      });
}
