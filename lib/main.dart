import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/login/login.dart';

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
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
      home: LoginScreen(),
    );
  }
}

// class MyCustomTransition extends StatelessWidget {
//   final Animation<double> animation;
//   final Widget child;

//   final sizeTween = Tween<double>(begin: 0.0, end: 300.0);
//   final opacityTween = Tween<double>(begin: 0.1, end: 1.0);

//   MyCustomTransition({this.animation, this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedBuilder(
//         animation: animation,
//         builder: (context, child) {
//           return Opacity(
//             opacity: opacityTween.evaluate(animation).clamp(0.0, 1.0),
//             child: Container(
//               height: 50 +
//                   sizeTween
//                       .evaluate(animation)
//                       .clamp(0.0, 500.0), // Recebendo o valor do sizeTween
//               width: sizeTween
//                   .evaluate(animation)
//                   .clamp(0.0, 500.0), // Recebendo o valor do _animation
//               child: FlutterLogo(), // Chamando a logo do Flutter
//             ),
//           );
//         },
//         child: child,
//       ),
//     );
//   }
// }
