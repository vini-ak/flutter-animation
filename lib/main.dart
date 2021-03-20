import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Intro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogoApp(),
    );
  }
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  AnimationController _animationController; // Controller da animação
  Animation<double> _animation; // Tipo da animação

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // Recebe o SingleTickerProviderStateMixin
      duration: Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 0, end: 300).animate(
        _animationController); // Define a faixa da animação. Que vai de 0px a 300px.

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    // A animação irá acontecer "para frente". De 0 a 300.
    _animationController.forward();
  }

  @override
  void dispose() {
    // O dispose é chamado quando o widget sai da tree de widgets.
    // Depois que o dispose é chamado, é como se ele não tivesse sido renderizado antes
    // Apagando as informações precendentes.
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AnimatedLogo(_animation));
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo(Animation<double> animation) : super(listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> _animation = listenable;
    return Center(
      child: Container(
        height: _animation.value, // Recebendo o valor do _animation
        width: _animation.value, // Recebendo o valor do _animation
        child: FlutterLogo(), // Chamando a logo do Flutter
      ),
    );
  }
}
