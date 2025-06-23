import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf0f2f5),
      appBar: AppBar(
        backgroundColor: Color(0xFFf0f2f5),
        title: Text("Settings"),
      ),
      body: const Center(child: Text("Settings")),
    );
  }
}
