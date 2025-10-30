import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Trips/data/models/bookmodel.dart';
import 'package:tourism_app/features/home/data/models/data_user_model.dart';

import '../../../data/repos/trips_repo.dart';

part 'books_cubit_state.dart';

class BooksCubitCubit extends Cubit<BooksCubitState> {
  BooksCubitCubit(this.tripsRepo) : super(BooksCubitInitial());
  final TripsRepo tripsRepo;
  List<DataUserModel> usersBooks = [];

  Future<void> getTrips(int id) async {
    emit(BooksCubitLoading());
    var result = await tripsRepo.getBooks();
    result.fold(
      (failure) => emit(BooksCubitFailure(errMessage: failure.errMessage)),
      (books) {
        usersBooks.clear();
        for (var book in books) {
          if (book.tripModel!.id == id) {
            usersBooks.add(book.dataUserModel ?? const DataUserModel());
          }
        }
        emit(BooksCubitSuccess(books: usersBooks));
      },
    );
  }
}
