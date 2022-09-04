import 'package:flutter/material.dart';
import 'package:password_blocks/view/main_menu.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainMenu(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            //Add password to the list on press
          },
        ),
        title: const Center(child: Text('Debug Page')),
      ),
      body: const Center(
        child: Text('Debug/Test here'),
      ),
    );
  }
}
