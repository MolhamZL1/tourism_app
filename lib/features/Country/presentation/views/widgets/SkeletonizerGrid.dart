import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/CountryItem.dart';

class SkeletonizerGrid extends StatefulWidget {
  const SkeletonizerGrid({super.key});

  @override
  State<SkeletonizerGrid> createState() => _SkeletonizerGridState();
}

class _SkeletonizerGridState extends State<SkeletonizerGrid> {
  final CountryModel countryModel = CountryModel(
      id: 0, photo: "images/dubai.jpg", rate: "rate", name: "name");

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width < 900 ? 2 : 4,
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
