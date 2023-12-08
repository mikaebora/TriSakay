import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome to My App!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}