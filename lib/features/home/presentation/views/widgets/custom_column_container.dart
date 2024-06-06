import 'package:flutter/material.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/ArrowAndPercantage.dart';

class CustomColumnContainer extends StatelessWidget {
  const CustomColumnContainer({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 15),
        Row(
          children: [
            Text(subTitle, style: const TextStyle(fontSize: 30)),
            const SizedBox(width: 80),
            const ArrowAndPercantage()
          ],
        )
      ],
    );
  }
}
