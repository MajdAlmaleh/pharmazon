import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pharmazon/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(
      String phoneNumber, String password) async {
    emit(AuthLoading());

    final result = await authRepo.signInWithEmailAndPassword(
        phoneNumber: phoneNumber, password: password);
 
    result.fold((failure) {
      emit(AuthFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(AuthSuccess(success['message']));
    });
  }

  Future<void> signUpWithEmailAndPassword(
    String phoneNumber,
    String password,
    String username,
  ) async {
    emit(AuthLoading());
    final result = await authRepo.signUpWithEmailAndPassword(
        phoneNumber: phoneNumber, password: password, username: username);
    print(result);
    result.fold((failure) {
      emit(AuthFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(AuthSuccess(success['message']));
    });
  }
}
