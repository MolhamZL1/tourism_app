import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/core/functions/buildContainerDecoratin.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/widgets/Rating.dart';
import 'package:tourism_app/features/Hotels/data/models/hotel_model/hotel_model.dart';

class HotelItem extends StatelessWidget {
  const HotelItem({super.key, this.loading = false, required this.hotelModel});

  final bool loading;
  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: buildContainerDecoration(),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  child: loading
                      ? Image.asset(
                          hotelModel.basicphoto!,
                          fit: BoxFit.cover,
                        )
                      : AnotherCarousel(
                          indicatorBgPadding: 2,
                          //  autoplay: false,
                          dotIncreasedColor: kColor,
                          dotSize: 5,
                          images: [
                              CachedNetworkImage(
                                imageUrl:
                                    "${ApiService.baseURL}${hotelModel.basicphoto!}",
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                              CachedNetworkImage(
                                imageUrl:
                                    "${ApiService.baseURL}${hotelModel.firstRoomPhoto!}",
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                              CachedNetworkImage(
                                imageUrl:
                                    "${ApiService.baseURL}${hotelModel.secondRoomPhoto!}",
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                              CachedNetworkImage(
                                imageUrl:
                                    "${ApiService.baseURL}${hotelModel.thirdRoomPhoto!}",
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ])),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(
                      Icons.location_city,
                      color: Colors.grey,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "${hotelModel.name}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.green,
                      ),
                      Text(
                        "${hotelModel.location} (${hotelModel.contrey!.name})",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Rating(avarage: hotelModel.rate!)
                ],
              ),
            )
          ],
        ));
  }
}
