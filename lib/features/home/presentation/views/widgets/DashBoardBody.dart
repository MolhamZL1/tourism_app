import 'package:flutter/material.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/GrayTitleTextForListView.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/TopSellingListView.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/TopSellingToursText.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/first_row.dart';

class DashBoardBody extends StatelessWidget {
  const DashBoardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(
          children: [
            FirstRow(),
            TopSellingToursText(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 75),
                      child: GrayTitleTextForListView(text: "Name")),
                  GrayTitleTextForListView(text: "Country"),
                  GrayTitleTextForListView(text: "Tour Cost"),
                  GrayTitleTextForListView(text: "Sold"),
                ],
              ),
            )
          ],
        ),
      ),
      SliverToBoxAdapter(
        child: TopSellingListView(),
      )
    ]);
  }
}
