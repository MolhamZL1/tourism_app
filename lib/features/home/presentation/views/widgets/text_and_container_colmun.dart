import 'package:flutter/material.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/CustomhomeViewContainer.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/containers_row.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/travel_dashboardtext.dart';

class TextAndContainerColmun extends StatelessWidget {
  const TextAndContainerColmun({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TravelDashBoardText(),
        CustomHomeViewContainer(
          title: "Total Income",
          subTitle: "150,000,000",
        ),
        ContainersRow(),
      ],
    );
  }
}
