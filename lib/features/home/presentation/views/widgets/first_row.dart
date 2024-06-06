import 'package:flutter/material.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/text_and_container_colmun.dart';

class FirstRow extends StatelessWidget {
  const FirstRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextAndContainerColmun(),
      ],
    );
  }
}
