import 'package:eip_app/features/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/verification/verification_bloc.dart';

class ResetPasswordConfirmationPage extends StatefulWidget {
  const ResetPasswordConfirmationPage({super.key, required this.email});
  final String email;

  @override
  ResetPasswordConfirmationPageState createState() =>
      ResetPasswordConfirmationPageState();
}

class ResetPasswordConfirmationPageState
    extends State<ResetPasswordConfirmationPage> {
  bool _isResending = false;

  void _onResend() {
    setState(() => _isResending = true);
    context.read<VerificationBloc>().add(
      ResendVerificationEmail(email: widget.email),
    );
  }

  void _onCheck() {
    context.read<VerificationBloc>().add(CheckVerificationStatus());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF40B3A2),
      body: SafeArea(
        child: BlocConsumer<VerificationBloc, VerificationState>(
          listener: (context, state) {
            if (state is VerificationLoading) {
            } else if (state is VerificationSuccess) {
              if (_isResending) {
                setState(() => _isResending = false);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Verification email resent!')),
                );
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => AuthPage()),
                  (_) => false,
                );
              }
            } else if (state is VerificationFailure) {
              if (_isResending) {
                setState(() => _isResending = false);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Resend failed: ${state.message}')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Verification failed: ${state.message}'),
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.email,
                          size: 64,
                          color: Color(0xFF40B3A2),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Email Sent',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'A password reset link has been sent to your email address.\n'
                          'Please check your inbox and follow the instructions.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),

                        // 1) Resend verification email
                        ElevatedButton(
                          onPressed: _isResending ? null : _onResend,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF40B3A2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            minimumSize: const Size.fromHeight(48),
                          ),
                          child:
                              _isResending
                                  ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                  : const Text(
                                    'Resend verification email',
                                    style: TextStyle(color: Colors.white),
                                  ),
                        ),
                        const SizedBox(height: 8),

                        // 2) I’ve clicked the link → check status
                        TextButton(
                          onPressed: _onCheck,
                          child: const Text('I’ve clicked the link'),
                        ),

                        const SizedBox(height: 8),

                        // 3) Back to Sign In
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).popUntil((r) => r.isFirst);
                          },
                          child: const Text('Back to Sign In'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
