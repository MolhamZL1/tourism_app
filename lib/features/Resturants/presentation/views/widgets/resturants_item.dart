import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/core/functions/build_container_decoratin.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/widgets/Rating.dart';
import 'package:tourism_app/features/Resturants/data/models/resturant_model/resturant_model.dart';
import 'package:tourism_app/features/Resturants/presentation/views/widgets/customRowCard.dart';

class ResturantItem extends StatelessWidget {
  const ResturantItem(
      {super.key, this.loading = false, required this.resturantModel});

  final bool loading;
  final ResturantModel resturantModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: buildContainerDecoration(),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                    child: loading
                        ? Image.asset(
                            resturantModel.photo!,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl:
                                "${ApiService.baseURL}${resturantModel.photo!}",
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: ShowRating(
                        avarage: resturantModel.rate!,
                        size: 25,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        color: Colors.white.withOpacity(.8),
                        width: double.infinity,
                        child: LayoutBuilder(builder: (context, constrains) {
                          return SizedBox(
                            width: constrains.maxWidth * .7,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomRowCard(
                                      text: resturantModel.openingHours!,
                                      iconColor: kColor,
                                      icon: Icons.schedule),
                                  const SizedBox(width: 8),
                                  CustomRowCard(
                                      text: resturantModel.closingHours!,
                                      iconColor: kColor,
                                      icon: Icons.lock_clock),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRowCard(
                      text: "${resturantModel.restaurantName}",
                      iconColor: Colors.grey,
                      icon: Icons.location_city),
                  const SizedBox(height: 8),
                  CustomRowCard(
                      text:
                          "${resturantModel.location} (${resturantModel.contrey!.name})",
                      iconColor: Colors.green,
                      icon: Icons.location_on),
                  const SizedBox(height: 8),
                  CustomRowCard(
                      text: resturantModel.phoneOfRestaurant!,
                      iconColor: kColor,
                      icon: Icons.phone),
                ],
              ),
            )
          ],
        ));
  }
}
