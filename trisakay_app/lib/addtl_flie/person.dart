import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 0, 83, 110), // Set the background color to blue
        ),
         // logo
          Positioned(
            top: 25.0, // Adjust the top position as needed
            right: 30.0, // Adjust the right position as needed
            child: Container(
              width: 100.0, // Set the width of the picture
              height: 100.0, // Set the height of the picture
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // Set the shape as circle or any other shape
                image: DecorationImage(
                  image: AssetImage('lib/images/Trisakaylogo.png'), // Replace with the actual image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        Positioned(
          top: 60.0, // Adjust the top position as needed
          left: 45.0, // Adjust the left position as needed
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
            heightFactor: 0.60, // Adjust the fraction as needed
            widthFactor: 1.0, // Takes full width
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white, // Set the background color to white
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0), // Adjust the radius as needed
                  topRight: Radius.circular(20.0), // Adjust the radius as needed
                ),
              ),
            ),
          ),
        ),
        // Add other widgets on top of the blue and white backgrounds as needed
        Positioned(
          top: 80, // Adjust the top position as needed
          right: 150, // Adjust the right position as needed
          child: Container(
            width: 110.0, // Set the width of the picture
            height: 110.0, // Set the height of the picture
            decoration: const BoxDecoration(
              shape: BoxShape.circle, // Set the shape as circle or any other shape
              color: Color(0xFFDDDDDD), // Set the background color of the circle
            ),
            child: const Icon(
              Icons.person,
              size: 60.0, // Set the size of the person icon as needed
              color: Color.fromARGB(255, 0, 83, 110), // Set the color of the person icon
            ),
          ),
        ),
        Positioned(
            top: 300, // Adjust the top position as needed
            left: 30, // Adjust the left position as needed
            child: Text(
              'Username',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 400, // Adjust the top position as needed
            left: 30, // Adjust the left position as needed
            child: Text(
              'Phone Number',
              style: GoogleFonts.poppins(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
      ],
    );
  }
}
