import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/functions/buildContainerDecoratin.dart';
import 'package:tourism_app/core/functions/customSnackBar.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/widgets/AdditionContainer.dart';
import 'package:tourism_app/core/widgets/SliverImageError.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/Rating.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/SkeletonizerGrid.dart';
import 'package:tourism_app/features/Trips/data/models/trip_model.dart';
import 'package:tourism_app/features/Trips/presentation/viewModels/cubit/trip_cubit.dart';

class TripsViewBody extends StatefulWidget {
  const TripsViewBody({super.key});

  @override
  State<TripsViewBody> createState() => _TripsViewBodyState();
}

class _TripsViewBodyState extends State<TripsViewBody> {
  @override
  void initState() {
    BlocProvider.of<TripCubit>(context).getTrips();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripCubit, TripState>(
      listener: (context, state) => state is TripFailure
          ? customshowSnackBar(context,
              color: Colors.red, massege: state.errMessage)
          : null,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Visibility(
                  visible: state is! TripFailure,
                  child: Image.asset("images/trip.png",
                      height: MediaQuery.of(context).size.height / 3,
                      fit: BoxFit.scaleDown),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              state is TripSuccess
                  ? SliverGrid.builder(
                      itemCount: state.trips.length + 1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width < 900 ? 2 : 4,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16),
                      itemBuilder: (context, index) => index ==
                              state.trips.length
                          ? const AdditionContainer(
                              // ontap: () => showDialog(
                              //   context: context,
                              //   builder: (_) => CustomAddCountryDailog(
                              //       nameController: nameController,
                              //       rateController: rateController,
                              //       formKey: formKey),
                              // ),
                              )
                          : GestureDetector(
                              onTap: () {
                                // showDialog(
                                //   context: context,
                                //   builder: (_) => CustomAddCountryDailog(
                                //     nameController: nameController,
                                //     rateController: rateController,
                                //     formKey: formKey,
                                //     countryModel: state.countries[index],
                                //   ),
                                // );
                              },
                              child: TripItem(tripModel: state.trips[index]),
                            ),
                    )
                  : state is TripLoading
                      ? const SkeletonizerGrid()
                      : state is TripFailure
                          ? SliverImageError(
                              errMessage: state.errMessage,
                            )
                          : const SliverToBoxAdapter(
                              child: SizedBox(),
                            ),
            ],
          ),
        );
      },
    );
  }
}

class TripItem extends StatelessWidget {
  const TripItem({super.key, this.loading = false, required this.tripModel});

  final bool loading;
  final TripModel tripModel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        " tripModel.country.photo",
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl:
                            "${ApiService.baseURL}${"tripModel.country.photo"}",
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${tripModel.tripPlace}-${"tripModel.country.name"}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          r"$" "${tripModel.price}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: kColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [Icon(Icons.lock_clock), Text("data")],
                    ),
                    Rating(avarage: "low")
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
