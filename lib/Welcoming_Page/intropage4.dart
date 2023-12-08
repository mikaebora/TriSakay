// ignore_for_file: sort_child_properties_last

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trisakay_app/Login/login.dart';

class IntroPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo Widget
          Image.asset(
            'lib/images/Trisakaylogo.png', // Replace with the actual path to your logo
            width: 300, // Adjust the width of the logo
            height: 300, // Adjust the height of the logo
          ),

          SizedBox(height: 20), // Add some space between the logo and the button

          // Elevated Button
          ElevatedButton(
            onPressed: () {
              // go to login page
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00536E),
              minimumSize: const Size(200, 65),
            ),
            child: Text(
              'Get Started',
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
