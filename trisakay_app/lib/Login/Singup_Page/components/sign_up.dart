import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trisakay_app/Login/Singup_Page/components/texfiled,signup.dart';

class SignUP extends StatelessWidget {
  const SignUP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Blue background
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 700,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 83, 110),
                    ),
                  ),
                ],
              ),

              // Create account text
              Positioned(
          top: 70, // Adjust the top position as needed
          left: 60, // Adjust the left position as needed
          child: Text(
            'CREATE ACCOUNT',
            style: GoogleFonts.poppins(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),

              // Text field for username
              Transform.translate(
                offset: const Offset(0, 200),
                child: const Align(
                  alignment: Alignment.center,
                  child: Textfield2(
                    hintText: 'Enter your username',
                  ),
                ),
              ),

              // Text field for password
              Transform.translate(
                offset: const Offset(0, 300),
                child: const Align(
                  alignment: Alignment.center,
                  child: Textfield2(
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                ),
              ),

              // Text field for name
              Transform.translate(
                offset: const Offset(0, 400),
                child: const Align(
                  alignment: Alignment.center,
                  child: Textfield2(
                    hintText: 'Enter your full name',
                  ),
                ),
              ),

              // Text field for phone number
              Transform.translate(
                offset: const Offset(0, 500),
                child: const Align(
                  alignment: Alignment.center,
                  child: Textfield2(
                    hintText: 'Enter your phone number',
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
              // Sign-up button
              Positioned(
                top: 600,
                left: 100,
                right: 100, // Center horizontally
                child: SizedBox(
                  width: 150, // Adjust the width here
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your sign-up logic here
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(255, 167, 36, 1.0)),
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
