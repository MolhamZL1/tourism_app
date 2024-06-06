import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tourism_app/core/utils/api_service.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/repos/airPalneCompanyRepo.dart';
import 'package:tourism_app/features/AirPlaneCompany/data/repos/airPlaneCompanyRepoImp.dart';
import 'package:tourism_app/features/Auth/data/repos/auth_repo.dart';
import 'package:tourism_app/features/Auth/data/repos/auth_repo_imp.dart';

import 'package:tourism_app/features/Country/data/repos/countryRepo.dart';
import 'package:tourism_app/features/Country/data/repos/countryRepoImp.dart';
import 'package:tourism_app/features/Trips/data/repos/trips_repo.dart';
import 'package:tourism_app/features/Trips/data/repos/trips_repo_imp.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(
    Dio(),
  ));
  getIt.registerSingleton<AuthRepo>(AuthRepoImp(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<CountryRepo>(CountryRepoImp(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<AirPalneCompanyRepo>(AirPlaneCompanyrepoImp(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<TripsRepo>(TripsRepoImp(
    getIt.get<ApiService>(),
  ));
}
