import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class PassDash extends StatefulWidget {
  const PassDash({super.key});

  @override
  State<PassDash> createState() => _PassDashState();
}

class _PassDashState extends State<PassDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(items: const [
        Icon(Icons.person),
        Icon(Icons.home),
        Icon(Icons.email),
      ]),
    );
  }
}