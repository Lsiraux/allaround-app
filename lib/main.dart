import 'package:eip_app/core/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/homepage_screen.dart';
import 'features/login_screen.dart';
import 'features/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
      ],
      child: MaterialApp(
        title: 'Portail Client',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        initialRoute: '/register',
        routes: {
          '/register': (context) => RegisterPage(),
          '/login': (context) => LoginPage(),
          '/dashboard': (context) => HomeScreen(),
        },
      ),
    );
  }
}
