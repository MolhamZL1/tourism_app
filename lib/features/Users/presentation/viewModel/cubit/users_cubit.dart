import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Users/data/models/user_model/user_model.dart';
import 'package:tourism_app/features/Users/data/repos/payment_repo.dart';

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
        userModels.clear();
        for (var user in users) {
          userModels.add(user);
        }
        emit(UsersSuccess(users: users));
      },
    );
  }

  void searchUserByEmail({required String quary}) {
    emit(UsersLoading());
    try {
      List<UserModel> result = [];
      for (var user in userModels) {
        if (user.clients!.email!.toLowerCase().contains(quary.toLowerCase())) {
          result.add(user);
        }
      }
      if (result.isNotEmpty) {
        emit(UsersSuccess(users: result));
      } else {
        emit(const UsersFailure(errMessage: "Not Found"));
      }
    } catch (e) {
      emit(UsersFailure(errMessage: e.toString()));
    }
  }
}
