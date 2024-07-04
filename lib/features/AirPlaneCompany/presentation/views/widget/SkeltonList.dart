import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/models/airPlaneCompanyModel.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/views/widget/AirPlaneItem.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';

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
                safe: 'safe',
                country: ContryModel(
                  id: 1,
                  name: "name",
                  photo: "photo",
                  rate: "rate",
                )),
          )),
    );
  }
}
