import 'package:flutter/material.dart';

void customshowLoadingCircle(BuildContext context, Color color) {
  showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: CircularProgressIndicator(
          color: color,
        ));
      });
}
