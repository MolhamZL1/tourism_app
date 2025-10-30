import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repos/payment_repo.dart';
part 'edit_user_state.dart';

class EditUserCubit extends Cubit<EditUserState> {
  EditUserCubit(this.paymentRepo) : super(EditUserInitial());
  final PaymentRepo paymentRepo;

  Future<void> deleteUser({required int id}) async {
    emit(EditUserLoading());
    var result = await paymentRepo.deleteUser(id: id);
    result.fold(
      (failure) => emit(EditUserFailure(errMessage: failure.errMessage)),
      (success) {
        emit(EditUserSuccess());
      },
    );
  }

  Future<void> chargeMoney(
      {int? id,
      required double money,
      String? email,
      required String operationType}) async {
    emit(EditUserLoading());
    var result = await paymentRepo.chargeMoney(
        email: email, id: id, money: money, operationType: operationType);
    result.fold(
      (failure) => emit(EditUserFailure(errMessage: failure.errMessage)),
      (success) {
        emit(EditUserSuccess());
      },
    );
  }
}
