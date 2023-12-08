import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trisakay_app/addtl_flie/dashboard.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 100),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 83, 110),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            "Sign In",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
