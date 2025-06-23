import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/auth_requests.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<SubmitRegister>(_onSubmitRegister);
  }

  Future<void> _onSubmitRegister(
    SubmitRegister event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      final response = await AuthRequests().registerRequest(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
      );
      print('--------------\n');
      print(response.body);
      print('--------------\n');

      emit(RegisterSuccess());
      //     if (response.statusCode == 200) {
      //       final token = response.body['token'];
      //       emit(RegisterSuccess(token));
      //     } else if (response.statusCode == 400) {
      //       final message = response.data['message'] ?? "Invalid credentials";
      //       emit(RegisterFailure(message));
      //     } else if (response.statusCode == 401) {
      //       final message = response.data['message'] ?? "Unauthorized";
      //       emit(RegisterUnauthorized(message));
      //     } else {
      //       emit(RegisterFailure("Unknown error"));
      //     }
    } catch (e) {
      emit(RegisterFailure("Network or parsing error"));
    }
  }
}
