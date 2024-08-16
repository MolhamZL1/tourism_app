import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/widgets/AdditionContainer.dart';
import 'package:tourism_app/core/widgets/SliverImageError.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/companies_cubit/companies_cubit.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/CountryCubit/country_cubit.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/SkeletonizerGrid.dart';
import 'package:tourism_app/features/Trips/presentation/viewModels/tripCubit/trip_cubit.dart';
import 'package:tourism_app/features/Trips/presentation/views/widgets/CustomAddTripDialog.dart';
import 'package:tourism_app/features/Trips/presentation/views/widgets/TripItem.dart';

import '../../../../../core/widgets/CustomSearchBar.dart';
import '../../../../../core/widgets/SliverNotFoundImage.dart';

class TripsViewBody extends StatefulWidget {
  const TripsViewBody({super.key});

  @override
  State<TripsViewBody> createState() => _TripsViewBodyState();
}

class _TripsViewBodyState extends State<TripsViewBody> {
  @override
  void initState() {
    BlocProvider.of<TripCubit>(context).getTrips();
    BlocProvider.of<CountryCubit>(context).getCountries();
    BlocProvider.of<CompaniesCubit>(context).getAirPlaneCompanies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripCubit, TripState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Visibility(
                visible:
                    !(state is TripFailure && state.errMessage != "Not Found"),
                child: Image.asset("images/trip.png",
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.scaleDown),
              ),
            ),
            SliverToBoxAdapter(child: CustomSearchBar(
              onChanged: (value) {
                if (value.isEmpty) {
                  BlocProvider.of<TripCubit>(context).getTrips();
                } else {
                  BlocProvider.of<TripCubit>(context).searchHotel(quary: value);
                }
              },
            )),
            state is TripSuccess
                ? SliverGrid.builder(
                    itemCount: state.trips.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.width < 900 ? 2 : 4,
                        mainAxisSpacing: 16),
                    itemBuilder: (context, index) => index == state.trips.length
                        ? AdditionContainer(
                            ontap: () => showDialog(
                              context: context,
                              builder: (_) => CustomAddTripDialog(
                                viewContext: context,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => CustomAddTripDialog(
                                  viewContext: context,
                                  tripModel: state.trips[index],
                                ),
                              );
                            },
                            child: TripItem(tripModel: state.trips[index]),
                          ),
                  )
                : state is TripLoading
                    ? const SkeletonizerGrid(
                        desktop: 4,
                        mobile: 2,
                      )
                    : state is TripFailure
                        ? state.errMessage == "Not Found"
                            ? const SliverNotFoundImage()
                            : SliverImageError(
                                errMessage: state.errMessage,
                              )
                        : const SliverToBoxAdapter(
                            child: SizedBox(),
                          ),
          ],
        );
      },
    );
  }
}
