import 'package:another_flushbar/flushbar.dart';
import 'package:eip_app/features/homepage/page/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/login/login_bloc.dart';
import 'widgets/forgot_password_page.dart';

class LoginCard extends StatefulWidget {
  final VoidCallback onSwitch;
  const LoginCard({super.key, required this.onSwitch});

  @override
  LoginCardState createState() => LoginCardState();
}

class LoginCardState extends State<LoginCard> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  void _showError(String message) {
    Flushbar(
      messageText: Center(child: Text(message)),
      icon: const Icon(Icons.error_outline, color: Colors.black),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(8.0),
      borderRadius: BorderRadius.circular(8.0),
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 500),
    ).show(context);
  }

  void _submit() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (builder) => const HomeScreen()),
      (route) => false,
    );
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
        SubmitLogin(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
    } else {
      _showError('Please correct the errors before submitting.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Card(
        key: widget.key,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: emailController,
                  focusNode: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
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
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(passwordFocus);
                  },
                ),
                const SizedBox(height: 16),

                // Password
                TextFormField(
                  controller: passwordController,
                  focusNode: passwordFocus,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'At least 8 characters';
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
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: const Text('Forgot password?'),
                  ),
                ),
                TextButton(
                  onPressed: widget.onSwitch,
                  child: const Text("Don't have an account? Register"),
                ),
                const Center(child: Text('Or')),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/apple_logo.png',
                        height: 32,
                      ),
                      onPressed: () {
                        // TODO: Handle Apple Sign-In
                      },
                      tooltip: 'Sign in with Apple',
                    ),
                    const SizedBox(width: 24),
                    IconButton(
                      icon: Image.asset(
                        'assets/images/google_logo.png',
                        height: 32,
                      ),
                      onPressed: () {
                        // TODO: Handle Google Sign-In
                      },
                      tooltip: 'Sign in with Google',
                    ),
                    const SizedBox(width: 24),
                    IconButton(
                      icon: Image.asset(
                        'assets/images/github_logo.png',
                        height: 32,
                      ),
                      onPressed: () {
                        // TODO: Handle GitHub Sign-In
                      },
                      tooltip: 'Sign in with GitHub',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
