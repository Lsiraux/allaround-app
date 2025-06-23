part of 'verification_bloc.dart';

abstract class VerificationEvent {}

class ResendVerificationEmail extends VerificationEvent {
  final String email;
  ResendVerificationEmail({required this.email});
}

class CheckVerificationStatus extends VerificationEvent {
  CheckVerificationStatus();
}
