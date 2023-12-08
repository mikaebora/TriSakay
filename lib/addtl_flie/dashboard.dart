// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:trisakay_app/addtl_flie/home.dart';
import 'package:trisakay_app/addtl_flie/message.dart';
import 'package:trisakay_app/addtl_flie/person.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 1;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    Person(),
    Home(),
    Message(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 0, 83, 110),
        animationDuration: const Duration(milliseconds: 400),
        index: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          Icon(Icons.person, color: Colors.white, size: 40),
          Icon(Icons.home, color: Colors.white, size: 40),
          Icon(Icons.email, color: Colors.white, size: 40),
        ],
      ),
    );
  }
}
