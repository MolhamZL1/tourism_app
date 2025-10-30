part of 'books_cubit_cubit.dart';

sealed class BooksCubitState extends Equatable {
  const BooksCubitState();

  @override
  List<Object> get props => [];
}

final class BooksCubitInitial extends BooksCubitState {}

final class BooksCubitSuccess extends BooksCubitState {
  final List<DataUserModel> books;

  const BooksCubitSuccess({required this.books});
}

final class BooksCubitFailure extends BooksCubitState {
  final String errMessage;

  const BooksCubitFailure({required this.errMessage});
}

final class BooksCubitLoading extends BooksCubitState {}
