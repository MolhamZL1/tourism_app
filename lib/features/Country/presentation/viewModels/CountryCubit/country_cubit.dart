import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';
import 'package:tourism_app/features/Country/data/repos/countryRepo.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit(this.countryRepo) : super(CountryInitial());
  final CountryRepo countryRepo;
  static List<String> bloccountriesNames = [];
  List<ContryModel> bloccountries = [];
  Future<void> getCountries() async {
    emit(CountryLoading());
    var result = await countryRepo.getCountries();
    result.fold(
      (failure) => emit(CountryFailure(errMessage: failure.errMessage)),
      (countries) {
        bloccountriesNames.clear();
        bloccountries.clear();
        for (var country in countries) {
          bloccountries.add(country);
          bloccountriesNames.add(country.name!);
        }
        emit(CountrySuccess(countries: countries));
      },
    );
  }

  void searchCountry({required String quary}) {
    emit(CountryLoading());
    try {
      List<ContryModel> result = [];
      for (var country in bloccountries) {
        if (country.name!.toLowerCase().contains(quary.toLowerCase())) {
          result.add(country);
        }
      }
      if (result.isNotEmpty) {
        emit(CountrySuccess(countries: result));
      } else {
        emit(const CountryFailure(errMessage: "Not Found"));
      }
    } catch (e) {
      emit(CountryFailure(errMessage: e.toString()));
    }
  }
}
