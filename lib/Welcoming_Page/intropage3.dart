import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class intropage3 extends StatefulWidget {
  const intropage3({super.key});

  @override
  State<intropage3> createState() => intropage3State();
}

class intropage3State extends State<intropage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 50,
            right: 50,
          child: Container(
            width: 300,
            height: 300,
          child: Lottie.network(
            'https://lottie.host/bdc03843-c5e6-411f-b894-9485a213ab76/vlU9R4MPHH.json',
            fit: BoxFit.cover,
              ),
            ),
          ) ,
          Positioned(
            top: 380, // Adjust the top position of the text
            child: Text(
              'Instant Ride Requests',
              style: GoogleFonts.poppins(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: Colors.black, // Set a contrasting text color
              ),
            ),
          ),
          Positioned(
            top: 450, // Adjust the top position of the text
            child: Text(
              'Forget about carrying cash',
              //'cash pay conveniently',
              //'through the app.',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Set a contrasting text color
              ),
            ),
          ),
          Positioned(
            top: 470,// Adjust the top position of the text
            child: Text(
              //'Forget about carrying',
              'pay conveniently through',
              //' the app.',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Set a contrasting text color
              ),
            ),
          ),
          Positioned(
            top: 490, // Adjust the top position of the text
            child: Text(
              //'Forget about carrying',
              //'cash pay conveniently',
              'the app.',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black, // Set a contrasting text color
              ),
            ),
          ),
        ]
      )
    );
  }
}
