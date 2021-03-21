import 'package:flutter/material.dart';
import 'inputField.dart';

class FormContainer extends StatefulWidget {
  @override
  _FormContainerState createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        child: Column(
          children: [
            InputField(
              icon: Icons.alternate_email,
              label: "E-mail",
              obscureText: false,
            ),
            InputField(
              icon: Icons.block,
              label: "Senha",
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
