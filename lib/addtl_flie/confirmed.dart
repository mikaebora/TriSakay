import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> with SingleTickerProviderStateMixin {
  // control
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool confirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
          
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                confirmed = !confirmed;
                confirmed ? _controller.forward() : _controller.reverse();
              });
            },
            child: Lottie.network(
              'https://lottie.host/279a8393-b7ba-4355-973d-0a673839c272/dQm7DH6FHD.json',
              controller: _controller,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            confirmed ? 'Confirmed!' : 'Tap Screen to Confirm',
            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
