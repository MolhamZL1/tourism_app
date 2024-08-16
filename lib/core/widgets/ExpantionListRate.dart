import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarsRatingBar extends StatelessWidget {
  const StarsRatingBar({
    super.key,
    required this.rateController,
    required this.label,
  });

  final TextEditingController rateController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(.7)),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " $label:",
                style: const TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: FittedBox(
                  child: RatingBar(
                      glowColor: Colors.amber,
                      maxRating: 5,
                      minRating: 1,
                      initialRating: double.parse(rateController.text),
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
                      onRatingUpdate: (value) =>
                          rateController.text = value.toString()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
