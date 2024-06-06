import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourism_app/core/shared/shared.dart';
import 'package:tourism_app/features/Auth/data/repos/auth_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.loginRepo) : super(LogoutInitial());
  final AuthRepo loginRepo;
  Future<void> fetchLogout() async {
    emit(LogoutLoading());
    //  var result = await loginRepo.fetchLogout();
    CacheNetwork.cacheInitialization();
    CacheNetwork.deleteCacheItem(key: "token");
    // result.fold(
    //   (failure) => emit(LogoutFailure(errMessage: failure.errMessage)),
    //   (success) =>
    emit(LogoutSuccess()
        // ),
        );
  }
}
