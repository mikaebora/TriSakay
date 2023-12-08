import 'package:flutter/material.dart';

class Textfield2 extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;

  const Textfield2({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }
}
