import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ShowRating extends StatelessWidget {
  const ShowRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.end,
    required this.avarage,
    this.size = 20,
  });

  final MainAxisAlignment mainAxisAlignment;
  final String avarage;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RatingBar(
            ignoreGestures: true,
            itemSize: size,
            glowColor: Colors.amber,
            maxRating: 5,
            minRating: 1,
            initialRating: double.parse(avarage),
            ratingWidget: RatingWidget(
              full: const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              half: const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              empty: const Icon(
                Icons.star,
                color: Colors.grey,
              ),
            ),
            onRatingUpdate: (value) {}),
      ],
    );
  }
}
