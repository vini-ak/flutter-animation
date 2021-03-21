import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool obscureText;

  InputField({this.icon, this.label, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            labelText: label,
            focusColor: Colors.white),
        obscureText: obscureText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
