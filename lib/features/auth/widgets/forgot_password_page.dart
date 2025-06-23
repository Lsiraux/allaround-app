import 'package:another_flushbar/flushbar.dart';
import 'package:eip_app/features/auth/widgets/reset_password_confirmation_page.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    emailFocus.dispose();
    super.dispose();
  }

  void _showMessage(String message, {Color color = Colors.green}) {
    Flushbar(
      messageText: Center(child: Text(message)),
      backgroundColor: color,
      icon: Icon(
        color == Colors.green ? Icons.check_circle : Icons.error_outline,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // 1) Show the Flushbar and await its dismissal
      final flush = Flushbar(
        messageText: const Center(child: Text('Password reset link sent!')),
        icon: const Icon(Icons.check_circle, color: Colors.white),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
      );

      flush.show(context).then((_) {
        if (!mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder:
                (_) => ResetPasswordConfirmationPage(
                  email: emailController.text.trim(),
                ),
          ),
          (route) => false,
        );
      });
    } else {
      _showMessage('Please enter a valid email.', color: Colors.red);
    }
  }

  /*void _submit() {
    if (_formKey.currentState!.validate()) {
      // TODO: dispatch your ResetPassword event, e.g.:
      // context.read<LoginBloc>().add(SubmitResetPassword(email: emailController.text.trim()));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder:
              (builder) => ResetPasswordConfirmationPage(
                email: emailController.text.trim(),
              ),
        ),
      );
      _showMessage('Password reset link sent!');
      Navigator.of(context).pop();
    } else {
      _showMessage('Please enter a valid email.', color: Colors.red);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF40B3A2),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Forgot Password',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: emailController,
                        focusNode: emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                          if (!regex.hasMatch(value)) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                        onFieldSubmitted: (_) => _submit(),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF40B3A2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size.fromHeight(48),
                        ),
                        child: const Text(
                          'Send Reset Link',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Back to Sign In'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
