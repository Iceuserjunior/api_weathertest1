import 'package:flutter/material.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Color(0x00ffffff),
      ),
    );
  }
}
