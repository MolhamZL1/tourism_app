import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/core/blocObserve/blocobserve.dart';
import 'package:tourism_app/core/utils/go_route.dart';
import 'package:tourism_app/core/utils/service_locator.dart';
import 'package:tourism_app/features/home/data/repos/profile_repo.dart';
import 'package:tourism_app/features/home/presentation/viewmodels/profilecubit/profile_cubit.dart';

void main() {
  setupServiceLocator();
  BlocOverrides.runZoned(() => runApp(const Rosemary()),
      blocObserver: MyBlocObserver());
}

class Rosemary extends StatelessWidget {
  const Rosemary({super.key});

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
