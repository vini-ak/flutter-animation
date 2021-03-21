import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/login/widgets/formContainer.dart';
import 'package:flutter_animation/screens/login/widgets/signUpButton.dart';
import 'package:flutter_animation/screens/login/widgets/staggerAnimation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // Criando o controller da animação
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 80, bottom: 40),
                      child: Icon(
                        Icons.block,
                        size: 120,
                        color: Colors.lightBlue[900],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormContainer(),
                    SignInButton(),
                  ],
                ),
                StaggerAnimation(
                  controller: _animationController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
