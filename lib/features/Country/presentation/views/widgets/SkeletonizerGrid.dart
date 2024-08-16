import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/CountryItem.dart';

class SkeletonizerGrid extends StatefulWidget {
  const SkeletonizerGrid({super.key, this.mobile = 2, this.desktop = 4});
  final int mobile;
  final int desktop;
  @override
  State<SkeletonizerGrid> createState() => _SkeletonizerGridState();
}

class _SkeletonizerGridState extends State<SkeletonizerGrid> {
  final ContryModel countryModel =
      ContryModel(id: 0, photo: "images/dubai.jpg", rate: "2", name: "name");

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width < 900
              ? widget.mobile
              : widget.desktop,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      itemBuilder: (context, index) => Skeletonizer(
        enabled: true,
        child: CountryItem(
          countryModel: countryModel,
          loading: true,
        ),
      ),
    );
  }
}
