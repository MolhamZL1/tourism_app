import 'package:flutter/material.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/CustomhomeViewContainer.dart';

class ContainersRow extends StatelessWidget {
  const ContainersRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomHomeViewContainer(title: "Statues Booked", subTitle: "55"),
        CustomHomeViewContainer(title: "Sold Tours", subTitle: "45 K"),
        CustomHomeViewContainer(title: "Canceled Tours", subTitle: "15")
      ],
    );
  }
}
