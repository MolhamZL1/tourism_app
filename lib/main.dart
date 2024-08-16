import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/blocObserve/customblocobserve.dart';
import 'package:tourism_app/core/utils/go_route.dart';
import 'package:tourism_app/core/utils/service_locator.dart';
import 'package:tourism_app/features/home/data/repos/profile_repo.dart';
import 'package:tourism_app/features/home/presentation/viewmodels/profilecubit/profile_cubit.dart';

import 'core/shared/shared.dart';

void main() async {
  await CacheNetwork.cacheInitialization();
  setupServiceLocator();
  Bloc.observer = CustomBlocObserver();
  runApp(const TourismApp());
}

class TourismApp extends StatelessWidget {
  const TourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt.get<ProfileRepo>()),
      child: MaterialApp.router(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        routerConfig: Routes.router,
      ),
    );
  }
}
