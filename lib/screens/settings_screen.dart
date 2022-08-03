import 'package:flutter/material.dart';
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please allow location!!'),
            Text('settings'),
          ],
        ),
      ),
    );
  }
}

