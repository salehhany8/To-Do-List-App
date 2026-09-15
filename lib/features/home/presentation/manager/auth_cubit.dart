import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/utils/firebase/auth_services.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthServices authServices;

  AuthCubit({
    required this.authServices,
  }) : super(InitialAuthState());
//sign up
  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    print('CUBIT CREATE ACCOUNT');
    emit(LoadingAuthState());

    try {
      await authServices.createAccount(
        email: email,
        password: password,
      );

      print('CREATE ACCOUNT SUCCESS');

      emit(SuccessAuthState());
    } catch (e) {
      print('CREATE ACCOUNT ERROR: $e');
      emit(
        FailedAuthState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
//login
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoadingAuthState());

    try {
      await authServices.login(
        email: email,
        password: password,
      );

      emit(SuccessAuthState());
    } catch (e) {
      emit(
        FailedAuthState(
          errorMessage: e.toString(),
        ),
      );
    }
  }


//   Future<void> signInWithGoogle() async {
//   emit(LoadingAuthState());

//   try {
//     await authServices.signInWithGoogle();

//     emit(SuccessAuthState());
//   } catch (e) {
//     emit(
//       FailedAuthState(
//         errorMessage: e.toString(),
//       ),
//     );
//   }
// }
}