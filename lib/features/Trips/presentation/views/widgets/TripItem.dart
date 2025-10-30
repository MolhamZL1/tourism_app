import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/core/functions/build_container_decoratin.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/features/Trips/data/models/trip_model.dart';

class TripItem extends StatefulWidget {
  const TripItem({super.key, this.loading = false, required this.tripModel});

  final bool loading;
  final TripModel tripModel;

  @override
  State<TripItem> createState() => _TripItemState();
}

class _TripItemState extends State<TripItem> {
  String? time;
  @override
  void initState() {
    time = DateFormatter.formatDateTime(
        dateTime: DateTime.parse(widget.tripModel.timeTrip!),
        outputFormat: 'yyyy/MM/dd');
    super.initState();
  }

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
                child: widget.loading
                    ? Image.asset(
                        widget.tripModel.country!.photo!,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl:
                            "${ApiService.baseURL}${widget.tripModel.country!.photo}",
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${widget.tripModel.tripPlace} (${widget.tripModel.country!.name})",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 8),
                      Text(time ?? ""),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.people_alt_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          Text(widget.tripModel.amountPeople.toString())
                        ],
                      ),
                      const Spacer(),
                      Text(
                        r"$" "${widget.tripModel.price}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kColor),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
