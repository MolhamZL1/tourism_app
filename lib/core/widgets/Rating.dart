import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.end,
    required this.avarage,
  });

  final MainAxisAlignment mainAxisAlignment;
  final String avarage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 16,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(
            avarage.toString(),
          ),
        ),
      ],
    );
  }
}
