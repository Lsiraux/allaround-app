part of 'register_bloc.dart';

abstract class RegisterEvent {}

class SubmitRegister extends RegisterEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  SubmitRegister({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });
}
