import 'package:flutter/material.dart';
import 'package:CodingPal/screens/loadingpage.dart';

void main() {
  runApp(CodingPal());
}

class CodingPal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: LoadingPage(),
    );
  }
}
