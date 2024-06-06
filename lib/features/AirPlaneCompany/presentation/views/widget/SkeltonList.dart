import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/models/airPlaneCompanyModel.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/views/widget/AirPlaneItem.dart';

class SkeltonList extends StatelessWidget {
  const SkeltonList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 4,
      itemBuilder: (context, index) => Skeletonizer(
          enabled: true,
          child: AirPlaneItem(
            loading: true,
            airPlaneCompanyModel: AirPlaneCompanyModel(
                name: "name",
                photo: "images/dubai.jpg",
                rate: "rate",
                id: 0,
                description: "description",
                location: "location",
                comforts: "comforts",
                food: 'food',
                service: 'service',
                safe: 'safe'),
          )),
    );
  }
}
