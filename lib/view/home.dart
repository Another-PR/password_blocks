import 'package:flutter/material.dart';
import 'package:password_blocks/view/main_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainMenu(),
      appBar: AppBar(
        title: const Center(child: Text('Block Pass')),
      ),
      body: const Center(
        child: Text('Coming Soon....'),
      ),
    );
  }
}
