import 'package:flutter/material.dart';

import 'main_drawer.dart';

class AgentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agents Page'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Agents Page'),
      ),
    );
  }
}
