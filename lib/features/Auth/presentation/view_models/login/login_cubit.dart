import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/features/Auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final AuthRepo loginRepo;
  Future<void> fetchLogin(
      {required String email, required String password}) async {
    emit(LoginLoading());
    var result = await loginRepo.fetchLogin(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginFailure(errMessage: failure.errMessage)),
      (success) => emit(LoginSuccess(token: success)),
    );
  }
}
