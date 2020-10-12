import 'package:flutter/material.dart';
import 'package:mdc_102/Constants/themes.dart';
import 'package:mdc_102/Screens/home.dart';

void main() => runApp(PracticeApp());

class PracticeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Practice App",
      theme: AppTheme.lightTheme(),
      initialRoute: '/home',
      onGenerateRoute: _getRoute,
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  if (settings.name != '/home') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => Home(),
    fullscreenDialog: true,
  );
}
