import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Resturants/data/repos/resturant_repo.dart';
import '../../../data/models/resturant_model/resturant_model.dart';
part 'resturants_state.dart';

class ResturantsCubit extends Cubit<ResturantsState> {
  ResturantsCubit(this.resturantRepo) : super(ResturantsInitial());
  final ResturantRepo resturantRepo;
  static List<String> blocresturantsNames = [];
  List<ResturantModel> blocresturants = [];

  Future<void> getResturants() async {
    emit(ResturantsLoading());
    var result = await resturantRepo.getResturant();
    result.fold(
      (failure) => emit(ResturantsFailure(errMessage: failure.errMessage)),
      (resturants) {
        emit(ResturantsSuccess(restaurants: resturants));
        blocresturantsNames.clear();
        blocresturants.clear();
        for (var resturant in resturants) {
          blocresturants.add(resturant);
          blocresturantsNames.add(resturant.restaurantName!);
        }
      },
    );
  }

  void searchResturant({required String quary}) {
    emit(ResturantsLoading());
    try {
      List<ResturantModel> result = [];
      for (var resturant in blocresturants) {
        if (resturant.restaurantName!
            .toLowerCase()
            .contains(quary.toLowerCase())) {
          result.add(resturant);
        }
      }
      if (result.isNotEmpty) {
        emit(ResturantsSuccess(restaurants: result));
      } else {
        emit(const ResturantsFailure(errMessage: "Not Found"));
      }
    } catch (e) {
      emit(ResturantsFailure(errMessage: e.toString()));
    }
  }
}
