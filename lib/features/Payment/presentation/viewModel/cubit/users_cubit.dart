import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Payment/data/models/user_model/user_model.dart';
import 'package:tourism_app/features/Payment/data/repos/payment_repo.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.paymentRepo) : super(UsersInitial());
  final PaymentRepo paymentRepo;
  static List<UserModel> userModels = [];
  Future<void> getUsers() async {
    emit(UsersLoading());
    var result = await paymentRepo.getUsers();
    result.fold(
      (failure) => emit(UsersFailure(errMessage: failure.errMessage)),
      (users) {
        users.clear();
        for (var user in users) {
          userModels.add(user);
        }
        emit(UsersSuccess());
      },
    );
  }
}
