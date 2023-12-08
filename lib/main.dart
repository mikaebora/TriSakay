// main.dart

import 'package:flutter/material.dart';
import 'signup/textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              // Blue background
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 83, 110),
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                  ),
                ],
              ),

              // Add profile outside the blue background
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://w7.pngwing.com/pngs/205/731/png-transparent-default-avatar-thumbnail.png'),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_a_photo),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Create account text
              Transform.translate(
                offset: const Offset(0, -280),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),

              // Text field for username
              Transform.translate(
                offset: const Offset(0, -80),
                child: const Align(
                  alignment: Alignment.center,
                  child: CustomTextField(
                    hintText: 'Enter your username',
                  ),
                ),
              ),

              // Text field for password
              Transform.translate(
                offset: const Offset(0, 0),
                child: const Align(
                  alignment: Alignment.center,
                  child: CustomTextField(
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                ),
              ),

              // Text field for name
              Transform.translate(
                offset: const Offset(0, 80),
                child: const Align(
                  alignment: Alignment.center,
                  child: CustomTextField(
                    hintText: 'Enter your full name',
                  ),
                ),
              ),

              // Text field for phone number
              Transform.translate(
                offset: const Offset(0, 160),
                child: const Align(
                  alignment: Alignment.center,
                  child: CustomTextField(
                    hintText: 'Enter your phone number',
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),

              // Text field for plate number
              Transform.translate(
                offset: const Offset(0, 240),
                child: const Align(
                  alignment: Alignment.center,
                  child: CustomTextField(
                    hintText: 'Enter your plate number',
                  ),
                ),
              ),

              // Sign-up button
              Positioned(
                bottom: 10,
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
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
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
