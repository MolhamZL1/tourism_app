import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Country/data/models/country_model.dart';
import 'package:tourism_app/features/Country/data/repos/countryRepo.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit(this.countryRepo) : super(CountryInitial());
  final CountryRepo countryRepo;
  static List<String> bloccountries = [];
  Future<void> getCountries() async {
    emit(CountryLoading());
    var result = await countryRepo.getCountries();
    result.fold(
      (failure) => emit(CountryFailure(errMessage: failure.errMessage)),
      (countries) {
        emit(CountrySuccess(countries: countries));
        bloccountries.clear();
        for (var country in countries) {
          bloccountries.add(country.name!);
        }
      },
    );
  }
}
