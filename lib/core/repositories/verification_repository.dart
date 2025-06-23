abstract class VerificationRepository {
  Future<void> resendVerificationEmail(String email);
  Future<bool> checkVerificationStatus();
}
