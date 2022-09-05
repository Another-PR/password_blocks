import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:password_blocks/view/debug.dart';
import 'package:password_blocks/view/home.dart';
import 'package:password_blocks/view/login_screen.dart';
import 'package:password_blocks/view/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.route:
            return PageTransition(
              child: HomePage(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case DebugPage.route:
            return PageTransition(
              child: DebugPage(),
              type: PageTransitionType.fade,
              settings: settings,
              // reverseDuration: Duration(seconds: 3),
            );
          case LoginScreen.route:
            return PageTransition(
              child: LoginScreen(),
              type: PageTransitionType.fade,
              settings: settings,
              // reverseDuration: Duration(seconds: 3),
            );
          case SignupScreen.route:
            return PageTransition(
              child: SignupScreen(),
              type: PageTransitionType.fade,
              settings: settings,
              // reverseDuration: Duration(seconds: 3),
            );
          default:
            return null;
        }
      },
    );
  }
}
