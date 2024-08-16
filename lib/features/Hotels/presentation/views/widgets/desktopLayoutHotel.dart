import 'package:flutter/material.dart';

import '../../../../../core/widgets/SelectImage.dart';
import '../../../data/models/hotel_model/hotel_model.dart';
import '../../viewModel/EditHotelsCubit/edit_hotels_cubit.dart';
import 'ratesHotelsDialog.dart';

class DesktoplayoutHotel extends StatelessWidget {
  const DesktoplayoutHotel(
      {super.key,
      this.hotelModel,
      required this.nameController,
      required this.rateController,
      required this.foodRateController,
      required this.comfortRateController,
      required this.safeRateController,
      required this.serviceRateController,
      required this.descriptionController,
      required this.locationController,
      required this.countryController,
      required this.isFailure});
  final HotelModel? hotelModel;
  final TextEditingController nameController;
  final TextEditingController rateController;
  final TextEditingController foodRateController;
  final TextEditingController comfortRateController;
  final TextEditingController safeRateController;
  final TextEditingController serviceRateController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;
  final TextEditingController countryController;
  final bool isFailure;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: isFailure,
                child: const Text(
                  "Images are required",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const Text(
                "Hotel",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SelectImage(
                  photo: hotelModel?.basicphoto,
                  onPhotoSelected: (value) => EditHotelsCubit.basephoto = value,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Rooms",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: SelectImage(
                        photo: hotelModel?.firstRoomPhoto,
                        onPhotoSelected: (value) =>
                            EditHotelsCubit.firstroomPhoto = value,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SelectImage(
                        photo: hotelModel?.secondRoomPhoto,
                        onPhotoSelected: (value) =>
                            EditHotelsCubit.secondRoomPhoto = value,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SelectImage(
                        photo: hotelModel?.thirdRoomPhoto,
                        onPhotoSelected: (value) =>
                            EditHotelsCubit.thirdRoomPhoto = value,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 12, left: 45),
            child: SingleChildScrollView(
              child: RatesHotelsDialog(
                descriptionController: descriptionController,
                locationController: locationController,
                nameController: nameController,
                rateController: rateController,
                foodRateController: foodRateController,
                comfortRateController: comfortRateController,
                safeRateController: safeRateController,
                serviceRateController: serviceRateController,
                countryController: countryController,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
