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
      duration: Duration(milliseconds: 1500),
    );
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves
            .elasticOut); // Define a faixa da animação. Que vai de 0px a 300px.

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
    return Scaffold(
      body: MyCustomTransition(
        animation: _animation,
        child: LogoWidget(),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogo(),
    );
  }
}

class MyCustomTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  final sizeTween = Tween<double>(begin: 0.0, end: 300.0);
  final opacityTween = Tween<double>(begin: 0.1, end: 1.0);

  MyCustomTransition({this.animation, this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: opacityTween.evaluate(animation).clamp(0.0, 1.0),
            child: Container(
              height: 50 +
                  sizeTween
                      .evaluate(animation)
                      .clamp(0.0, 500.0), // Recebendo o valor do sizeTween
              width: sizeTween
                  .evaluate(animation)
                  .clamp(0.0, 500.0), // Recebendo o valor do _animation
              child: FlutterLogo(), // Chamando a logo do Flutter
            ),
          );
        },
        child: child,
      ),
    );
  }
}
