import 'package:flutter/material.dart';
import 'package:mdc_102/Constants/colors.dart';
import 'package:mdc_102/Constants/themes.dart';
import 'package:mdc_102/Screens/backdrop.dart';
import 'package:mdc_102/Screens/category_menu_page.dart';
import 'package:mdc_102/Screens/home.dart';

import 'Models/product.dart';

void main() => runApp(PracticeApp());

class PracticeApp extends StatefulWidget {
  @override
  _PracticeAppState createState() => _PracticeAppState();
}

class _PracticeAppState extends State<PracticeApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Practice App",
      theme: AppTheme.lightTheme(),
      // initialRoute: '/home',
      // onGenerateRoute: _getRoute,
      home: Backdrop(
          currentCategory: Category.all,
          frontLayer: Home(
            category: _currentCategory,
          ),
          backLayer: CategoryMenuPage(
              currentCategory: _currentCategory, onCategoryTap: _onCategoryTap),
          frontTitle: Text("SHRINE"),
          backTitle: Text("MENU")),
    );
  }
}

// Route<dynamic> _getRoute(RouteSettings settings) {
//   if (settings.name != '/home') {
//     return null;
//   }

//   return MaterialPageRoute<void>(
//     settings: settings,
//     builder: (BuildContext context) => Home(),
//     fullscreenDialog: true,
//   );
// }
