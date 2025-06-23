part of 'verification_bloc.dart';

abstract class VerificationState {}

class VerificationInitial extends VerificationState {
  VerificationInitial();
}

class VerificationLoading extends VerificationState {
  VerificationLoading();
}

class VerificationSuccess extends VerificationState {
  VerificationSuccess();
}

class VerificationFailure extends VerificationState {
  final String message;
  VerificationFailure(this.message);
}

class VerificationUnauthorized extends VerificationState {
  final String message;
  VerificationUnauthorized(this.message);
}
