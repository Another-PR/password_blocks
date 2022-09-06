import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:password_blocks/constants.dart';
import 'package:password_blocks/view/debug.dart';
import 'package:password_blocks/view/screens/home.dart';
import 'package:password_blocks/view/screens/login_screen.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(child: Gap(20)),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomePage.route);
            },
          ),
          if (DEBUG_MODE)
            ListTile(
              title: const Text('Debug'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(DebugPage.route);
              },
            ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.route);
            },
          ),
        ],
      ),
    );
  }
}
