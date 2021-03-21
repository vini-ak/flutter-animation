import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({this.controller})
      : buttonSqueeze = Tween<double>(begin: 280, end: 50).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.15),
          ),
        ),
        buttonZoomOut = Tween<double>(begin: 50, end: 1000).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.6, 1, curve: Curves.bounceOut),
          ),
        );

  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: _buildExpandEffect(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }

  Widget _buildExpandEffect(context) {
    // Caso o valor de buttonZoomOut seja menor do que 50
    // a animação de comprimir o botão para um círculo será chamada.
    // Se for maior, o botão se expande e cobre a tela inteira.
    return buttonZoomOut.value <= 50
        ? Container(
            width: buttonSqueeze.value,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.lightBlue[800]),
            child: _buildInside(context),
          )
        : Container(
            width: buttonZoomOut.value,
            height: buttonZoomOut.value,
            decoration: BoxDecoration(color: Colors.lightBlue[800]),
          );
  }

  Widget _buildInside(BuildContext context) {
    // Se o botão tiver largura maior do que 75 ele terá
    // um Text como filho dentro dele.
    // Se for menor, será um CircularProgressIndicator.
    if (buttonSqueeze.value > 75) {
      return Text(
        "Sign in",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      );
    } else {
      return CircularProgressIndicator(
        // color: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
  }
}
