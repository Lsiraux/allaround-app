import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/auth_requests.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SubmitLogin>(_onSubmitLogin);
  }

  Future<void> _onSubmitLogin(
    SubmitLogin event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final response = await AuthRequests().loginRequest(
        email: event.email,
        password: event.password,
      );
      print('--------------\n');
      print("response.body");
      print('--------------\n');

      emit(LoginSuccess());
      //     if (response.statusCode == 200) {
      //       final token = response.body['token'];
      //       emit(LoginSuccess(token));
      //     } else if (response.statusCode == 400) {
      //       final message = response.data['message'] ?? "Invalid credentials";
      //       emit(LoginFailure(message));
      //     } else if (response.statusCode == 401) {
      //       final message = response.data['message'] ?? "Unauthorized";
      //       emit(LoginUnauthorized(message));
      //     } else {
      //       emit(LoginFailure("Unknown error"));
      //     }
    } catch (e) {
      emit(LoginFailure("Network or parsing error"));
    }
  }
}
