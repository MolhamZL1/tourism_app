import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/SliverImageError.dart';
import '../../../../Country/presentation/views/widgets/SkeletonizerGrid.dart';
import '../../../../Trips/presentation/viewModels/tripCubit/trip_cubit.dart';
import '../../../../Trips/presentation/views/widgets/CustomAddTripDialog.dart';
import '../../../../Trips/presentation/views/widgets/TripItem.dart';
import 'QuickTranscation.dart';
import 'TopSellingToursText.dart';
import 'travel_dashboardtext.dart';

class MainDsahBoard extends StatelessWidget {
  const MainDsahBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripCubit, TripState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TravelDashBoardText(),
                QuickTranscation(),
                TopSellingToursText()
              ],
            )),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            state is TripSuccess
                ? SliverGrid.builder(
                    itemCount: state.trips.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.width < 900 ? 2 : 3,
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
                        desktop: 3,
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
