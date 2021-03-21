import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Ainda não possui uma conta? Cadastre-se",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
