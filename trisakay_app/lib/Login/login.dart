import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trisakay_app/Login/Singup_Page/components/my_textfield.dart';
import 'package:trisakay_app/Login/Singup_Page/components/sign_in_bttn.dart';
import 'package:trisakay_app/Login/Singup_Page/components/sign_up.dart';

class LoginPage extends StatelessWidget {

  
  LoginPage({super.key});

  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  
  // user sign in
  void signUserIn(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
            // logo
              Image.asset(
                alignment: const Alignment(0, -2),
                'lib/images/Trisakaylogo.png', // Replace with the actual path to your logo
                width: 300, // Adjust the width of the logo
                height: 300, // Adjust the height of the logo
              ),
            
            
            // log in text
            Transform.translate(
                  offset: const Offset(-120, -110), // Adjust the vertical offset to move it upward
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'LOGIN',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
            
            // username
            Transform.translate(
                  offset: const Offset(0, -100),
                  child: Align(
                    alignment: Alignment.center,
                    child: MyTextField(
                      contoller: usernameController,
                      hintText: 'Username',
                      obscuretext: false,
                      prefixIcon: Icons.person,
                    ),
                  ),
                ),
            
            const SizedBox(height: 25),
            
            //password
            Transform.translate(
                  offset: const Offset(0, -100),
                  child: Align(
                    alignment: Alignment.center,
                    child: MyTextField(
                      contoller: passwordController,
                      hintText: 'Password',
                      obscuretext: true,
                      prefixIcon: Icons.lock,
                    ),
                  ),
                ),

            //forgot password?
            
            // remember me
            
            // sign in button
            Transform.translate(
              offset: const Offset(0, -5),
              child: Align(
                    alignment: Alignment.center,
              child: MyButton(
                onTap: signUserIn,
              ),
            ),
          ),
            const SizedBox(height: 25),

            // creating account

          Transform.translate(
                  offset: const Offset(-50, 13), // Adjust the vertical offset to move it upward
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Don't have an account?",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),

            // sign up text bttn

          Transform.translate(
                  offset: const Offset(70, -20), // Adjust the vertical offset to move it upward
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 255, 90, 0),
                        textStyle: const TextStyle(fontSize: 15,)
                      ),
                      onPressed: (){

                        // go to signing up page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUP(),),);
                        
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
                ),
            ]
            ),
          ),
        ),
      ),
    );
  }
}