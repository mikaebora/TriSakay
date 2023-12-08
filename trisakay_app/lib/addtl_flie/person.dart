import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 0, 83, 110), 
        ),
         // logo
          Positioned(
            top: 25.0, 
            right: 30.0, 
            child: Container(
              width: 100.0, 
              height: 100.0, 
              decoration: const BoxDecoration(
                shape: BoxShape.circle, 
                image: DecorationImage(
                  image: AssetImage('lib/images/Trisakaylogo.png'), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        Positioned(
          top: 60.0, 
          left: 45.0, 
          child: Text(
            'PROFILE',
            style: GoogleFonts.poppins(
              fontSize: 21,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: 0.60, 
            widthFactor: 1.0, 
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0), 
                  topRight: Radius.circular(20.0), 
                ),
              ),
            ),
          ),
        ),
        
        Positioned(
          top: 80, 
          right: 150, 
          child: Container(
            width: 110.0, 
            height: 110.0, 
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFDDDDDD), 
            ),
            child: const Icon(
              Icons.person,
              size: 60.0, 
              color: Color.fromARGB(255, 0, 83, 110), 
            ),
          ),
        ),
        Positioned(
            top: 300, 
            left: 30, 
            child: Text(
              'Username',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 400, 
            left: 30, 
            child: Text(
              'Phone Number',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
      ],
    );
  }
}
