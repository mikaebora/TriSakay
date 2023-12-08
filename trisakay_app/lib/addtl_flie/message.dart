import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 600.0,
            height: 140.0,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 83, 110),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30), // Set the bottom radius as needed
              ),
            ),
          ),
          const Positioned(
            top:90.0, // Adjust the top position as needed
            left: 60.0, // Adjust the left position as needed
            child: Text(
              'MESSAGES',
              style: TextStyle(fontSize: 21, color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
          const Center(
            child: Text(
              'Text Inside Blue Background',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}