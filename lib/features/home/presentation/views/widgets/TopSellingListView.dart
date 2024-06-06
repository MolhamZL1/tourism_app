import 'package:flutter/material.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/CustomListViewItem.dart';

class TopSellingListView extends StatelessWidget {
  const TopSellingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => const CustomListViewItem(
        tourCost: "45000",
      ),
    );
  }
}
