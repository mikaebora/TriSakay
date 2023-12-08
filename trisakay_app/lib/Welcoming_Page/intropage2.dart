import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class intropage2 extends StatefulWidget {
  const intropage2({super.key});

  @override
  State<intropage2> createState() => intropage2State();
}

class intropage2State extends State<intropage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 50,
            left: -15,
            child: Container(
            width: 300,
            height: 300,
          child: Lottie.network(
            'https://lottie.host/ee25af10-6624-4e53-b483-cbafa4a56b95/NP74Vq0k22.json',
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
              'Track your ride in real-time',
              
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
              
              'and know exactly when',
             
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
              
              'your tricycle will arrive.',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black, 
              ),
            ),
          ),
        ],
      ) ,
    );
  }
}
