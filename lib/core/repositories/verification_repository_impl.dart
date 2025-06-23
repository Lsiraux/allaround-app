import 'package:eip_app/core/repositories/verification_repository.dart';

class VerificationRepositoryImpl implements VerificationRepository {
  @override
  Future<void> resendVerificationEmail(String email) async {
    // your actual API call / logic here
  }

  @override
  Future<bool> checkVerificationStatus() async {
    return true;
    // your actual API call / logic here
  }
}
