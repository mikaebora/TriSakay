import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final contoller;
  final String hintText;
  final bool obscuretext;
  final IconData prefixIcon;

  const MyTextField({
    super.key,
    required this.contoller,
    required this.hintText,
    required this.obscuretext,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      child: TextField(
        controller: contoller,
        obscureText: obscuretext,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade800),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          prefixIconConstraints:  const BoxConstraints(
            minHeight: 20,
            minWidth: 40,
          ),
        ),
      ),
    );
  }
}
