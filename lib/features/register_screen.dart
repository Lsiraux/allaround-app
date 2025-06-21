import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/bloc/register_bloc.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  RegisterPage({super.key});

  void _register(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();

    if (email.isNotEmpty &&
        password.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Inscription réussie !")),
            );
            _register(context);
          } else if (state is RegisterFailure ||
              state is RegisterUnauthorized) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('zeub')));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Connexion",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Mot de passe",
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: firstNameController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Prénom"),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: lastNameController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Nom"),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      emailController.text = 'lucas.siraux@live.fr';
                      passwordController.text = 'test1234';
                      firstNameController.text = 'Lucas';
                      lastNameController.text = 'Siraux';
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      final firstName = firstNameController.text.trim();
                      final lastName = lastNameController.text.trim();

                      context.read<RegisterBloc>().add(
                        SubmitRegister(
                          email: email,
                          password: password,
                          firstName: firstName,
                          lastName: lastName,
                        ),
                      );
                    },
                    child: const Text("Se connecter"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
