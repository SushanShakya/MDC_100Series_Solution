import 'package:flutter/material.dart';
import 'package:mdc_102/Screens/login_screen.dart';

import 'Constants/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Practice App",
      theme: AppTheme.lightTheme(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => LoginScreen(),
    fullscreenDialog: true,
  );
}
