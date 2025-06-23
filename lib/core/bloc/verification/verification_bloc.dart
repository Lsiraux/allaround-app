// lib/core/bloc/verification/verification_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/verification_repository.dart';
import '../../repositories/verification_repository_impl.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final VerificationRepository _repository;

  VerificationBloc()
    : _repository = VerificationRepositoryImpl(),
      super(VerificationInitial()) {
    on<ResendVerificationEmail>(_onResendVerificationEmail);
    on<CheckVerificationStatus>(_onCheckVerificationStatus);
  }

  Future<void> _onResendVerificationEmail(
    ResendVerificationEmail event,
    Emitter<VerificationState> emit,
  ) async {
    emit(VerificationLoading());
    try {
      await _repository.resendVerificationEmail(event.email);
      emit(VerificationSuccess());
    } catch (e) {
      emit(VerificationFailure(e.toString()));
    }
  }

  Future<void> _onCheckVerificationStatus(
    CheckVerificationStatus event,
    Emitter<VerificationState> emit,
  ) async {
    emit(VerificationLoading());
    try {
      final bool isVerified = await _repository.checkVerificationStatus();
      if (isVerified) {
        emit(VerificationSuccess());
      } else {
        emit(VerificationFailure('User not yet verified.'));
      }
    } catch (e) {
      emit(VerificationFailure(e.toString()));
    }
  }
}
