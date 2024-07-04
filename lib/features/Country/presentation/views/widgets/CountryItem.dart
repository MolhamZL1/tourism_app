import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/core/functions/buildContainerDecoratin.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';
import 'package:tourism_app/core/widgets/Rating.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({
    super.key,
    required this.countryModel,
    this.loading = false,
  });
  final ContryModel? countryModel;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: buildContainerDecoration(),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
                child: loading
                    ? Image.asset(
                        countryModel!.photo!,
                        fit: BoxFit.cover,
                      )
                    : BackdropFilter(
                        filter: ImageFilter.blur(tileMode: TileMode.mirror),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${ApiService.baseURL}${countryModel!.photo}",
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        countryModel!.name!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Rating(avarage: countryModel!.rate!),
                ],
              ),
            )
          ],
        ));
  }
}
