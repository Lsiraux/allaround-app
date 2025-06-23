import 'package:eip_app/features/auth/register_card.dart';
import 'package:flutter/material.dart';

import 'login_card.dart';

class AuthPage extends StatefulWidget {
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  bool _showLogin = true;

  void _toggleCard() {
    setState(() => _showLogin = !_showLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF40B3A2),
      body: SafeArea(
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              // Fade + scale transition
              return ScaleTransition(
                scale: animation,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child:
                _showLogin
                    ? LoginCard(
                      key: const ValueKey('login'),
                      onSwitch: _toggleCard,
                    )
                    : RegisterCard(
                      key: const ValueKey('register'),
                      onSwitch: _toggleCard,
                    ),
          ),
        ),
      ),
    );
  }
}
