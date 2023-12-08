import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class intropage1 extends StatefulWidget {
  const intropage1({Key? key}) : super(key: key);

  @override
  State<intropage1> createState() => intropage1State();
}

class intropage1State extends State<intropage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 50, 
            child: Container(
              width: 300,
              height: 300,
              child: Lottie.network(
                'https://lottie.host/5fff0be9-c525-4549-b9cf-de54fec90cee/vN7q0DIdew.json',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 380, 
            child: Text(
              'Instant Ride Requests',
              style: GoogleFonts.poppins(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: Colors.black, 
              ),
            ),
          ),
          Positioned(
            top: 450, 
            child: Text(
              'Effortlessly book a tricycle',
              
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black, 
              ),
            ),
          ),
          Positioned(
            top: 470, 
            child: Text(
              
              ' with just a few taps on',
             
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black, 
              ),
            ),
          ),
          Positioned(
            top: 490, 
            child: Text(
              
              'your phone.',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
