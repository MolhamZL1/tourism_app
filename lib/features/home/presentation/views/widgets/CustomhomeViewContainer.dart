import 'package:flutter/material.dart';
import 'package:tourism_app/core/functions/buildContainerDecoratin.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/custom_column_container.dart';

class CustomHomeViewContainer extends StatelessWidget {
  const CustomHomeViewContainer(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: SizedBox(
        child: Container(
          decoration: buildContainerDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: CustomColumnContainer(
              title: title,
              subTitle: subTitle,
            ),
          ),
        ),
      ),
    );
  }
}
