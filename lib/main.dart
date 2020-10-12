import 'package:flutter/material.dart';
import 'package:mdc_102/Screens/home.dart';

void main() => runApp(PracticeApp());

class PracticeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Practice App",
      home: Home(),
    );
  }
}
