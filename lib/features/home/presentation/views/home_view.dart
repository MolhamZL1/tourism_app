import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/utils/constants,.dart';
import 'package:tourism_app/core/utils/service_locator.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/repos/airPalneCompanyRepo.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/companies_cubit/companies_cubit.dart';
import 'package:tourism_app/features/AirPlaneCompany/presentation/viewmodel/edit_company_cubit/edit_company_cubit.dart';
import 'package:tourism_app/features/Country/data/repos/countryRepo.dart';
import 'package:tourism_app/features/Country/presentation/viewModels/CountryCubit/country_cubit.dart';
import 'package:tourism_app/features/Hotels/data/repos/hotel_repo.dart';
import 'package:tourism_app/features/Hotels/presentation/viewModel/EditHotelsCubit/edit_hotels_cubit.dart';
import 'package:tourism_app/features/Hotels/presentation/viewModel/HotelsCubit/hotels_cubit.dart';
import 'package:tourism_app/features/Trips/data/repos/trips_repo.dart';
import 'package:tourism_app/features/Trips/presentation/viewModels/tripCubit/trip_cubit.dart';
import 'package:tourism_app/features/home/presentation/viewmodels/profilecubit/profile_cubit.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/CustomAppBar.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/CustomDrawer.dart';
import 'package:tourism_app/features/home/presentation/views/widgets/HomeViewBody.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int _selectedIndex = 0;
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CountryCubit(getIt.get<CountryRepo>()),
        ),
        BlocProvider(
          create: (context) => CompaniesCubit(getIt.get<AirPalneCompanyRepo>()),
        ),
        BlocProvider(
          create: (context) =>
              EditCompanyCubit(getIt.get<AirPalneCompanyRepo>()),
        ),
        BlocProvider(
          create: (context) => HotelsCubit(getIt.get<HotelRepo>()),
        ),
        BlocProvider(
          create: (context) => EditHotelsCubit(getIt.get<HotelRepo>()),
        ),
        BlocProvider(
          create: (context) => TripCubit(getIt.get<TripsRepo>()),
        ),
      ],
      child: Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(
            destenations: destenations,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (value) =>
                setState(() => _selectedIndex = value)),
        appBar: CustomAppBar(scaffoldKey: scaffoldKey),
        body: HomeViewBody(selectedIndex: _selectedIndex),
      ),
    );
  }
}
