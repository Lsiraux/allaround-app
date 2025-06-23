import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/register/register_bloc.dart';

class RegisterCard extends StatefulWidget {
  final VoidCallback onSwitch;
  const RegisterCard({super.key, required this.onSwitch});

  @override
  RegisterCardState createState() => RegisterCardState();
}

class RegisterCardState extends State<RegisterCard> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final firstNameFocus = FocusNode();
  final lastNameFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    firstNameFocus.dispose();
    lastNameFocus.dispose();
    super.dispose();
  }

  void _showError(
    String message, {
    Color color = Colors.red,
    IconData icon = Icons.report_problem,
  }) {
    Flushbar(
      messageText: Center(child: Text(message)),
      icon: Icon(icon, color: Colors.black),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(8.0),
      borderRadius: BorderRadius.circular(8.0),
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 500),
    ).show(context);
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<RegisterBloc>().add(
        SubmitRegister(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
        ),
      );
    } else {
      _showError('Please fix errors before submitting.');
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
                  'Register',
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
                      return 'Veuillez saisir votre email';
                    }
                    final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                    if (!regex.hasMatch(value)) return 'Email invalide';
                    return null;
                  },
                  onFieldSubmitted:
                      (_) => FocusScope.of(context).requestFocus(passwordFocus),
                ),
                const SizedBox(height: 16),

                // Mot de passe
                TextFormField(
                  controller: passwordController,
                  focusNode: passwordFocus,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez saisir votre mot de passe';
                    }
                    if (value.length < 8) {
                      return 'Au moins 8 caractères';
                    }
                    return null;
                  },
                  onFieldSubmitted:
                      (_) =>
                          FocusScope.of(context).requestFocus(firstNameFocus),
                ),
                const SizedBox(height: 16),

                // Prénom
                TextFormField(
                  controller: firstNameController,
                  focusNode: firstNameFocus,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Prénom',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez saisir votre prénom';
                    }
                    return null;
                  },
                  onFieldSubmitted:
                      (_) => FocusScope.of(context).requestFocus(lastNameFocus),
                ),
                const SizedBox(height: 16),

                // Nom
                TextFormField(
                  controller: lastNameController,
                  focusNode: lastNameFocus,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez saisir votre nom";
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
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: widget.onSwitch,
                  child: const Text('Already have an account? Sign In'),
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
