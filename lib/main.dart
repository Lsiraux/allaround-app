// lib/main.dart

import 'package:eip_app/core/bloc/projects/projects_bloc.dart';
import 'package:eip_app/core/bloc/register/register_bloc.dart';
import 'package:eip_app/core/bloc/verification/verification_bloc.dart';
import 'package:eip_app/features/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
        BlocProvider<VerificationBloc>(create: (context) => VerificationBloc()),
        BlocProvider<ProjectsBloc>(create: (context) => ProjectsBloc()),
      ],
      child: MaterialApp(
        title: 'AllAround',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        home: AuthPage(),
      ),
    );
  }
}
