import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:password_blocks/view/debug.dart';
import 'package:password_blocks/view/home.dart';

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
          case '/home':
            return PageTransition(
              child: HomePage(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case '/debug':
            return PageTransition(
              child: DebugPage(),
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
