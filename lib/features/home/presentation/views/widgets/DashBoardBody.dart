import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/widgets/AdditionContainer.dart';
import 'package:tourism_app/core/widgets/SliverImageError.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/companies_cubit/companies_cubit.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/CountryCubit/country_cubit.dart';
import 'package:tourism_app/features/Country/presentation/views/widgets/SkeletonizerGrid.dart';
import 'package:tourism_app/features/Trips/presentation/viewModels/tripCubit/trip_cubit.dart';
import 'package:tourism_app/features/Trips/presentation/views/widgets/CustomAddTripDialog.dart';
import 'package:tourism_app/features/Trips/presentation/views/widgets/TripItem.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/TopSellingToursText.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/first_row.dart';

class DashBoardBody extends StatefulWidget {
  const DashBoardBody({
    super.key,
  });

  @override
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
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
                child: Column(
              children: [
                FirstRow(),
                TopSellingToursText(),
              ],
            )),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            state is TripSuccess
                ? SliverGrid.builder(
                    itemCount: state.trips.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.width < 900 ? 2 : 4,
                        mainAxisSpacing: 16),
                    itemBuilder: (context, index) => GestureDetector(
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
                        ? SliverImageError(
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
