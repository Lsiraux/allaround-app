part of 'register_bloc.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure(this.message);
}

class RegisterUnauthorized extends RegisterState {
  final String message;

  RegisterUnauthorized(this.message);
}
