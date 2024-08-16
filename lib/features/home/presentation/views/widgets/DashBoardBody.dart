import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/companies_cubit/companies_cubit.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/CountryCubit/country_cubit.dart';
import 'package:tourism_app/features/Trips/presentation/viewModels/tripCubit/trip_cubit.dart';
import 'package:tourism_app/features/Users/presentation/viewModel/cubit/users_cubit.dart';

import 'MainDsahBoard.dart';
import 'charts.dart';

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
    BlocProvider.of<UsersCubit>(context).getUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: MainDsahBoard(),
        ),
        MediaQuery.of(context).size.width > 900
            ? const Expanded(
                child: Charts(),
              )
            : const SizedBox()
      ],
    );
  }
}
