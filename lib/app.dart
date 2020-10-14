import 'package:flutter/material.dart';
import 'package:mdc_102/Models/product.dart';
import 'package:mdc_102/Screens/backdrop.dart';
import 'package:mdc_102/Screens/category_menu_page.dart';
import 'package:mdc_102/Screens/home.dart';

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
    return Backdrop(
        currentCategory: Category.all,
        frontLayer: Home(
          category: _currentCategory,
        ),
        backLayer: CategoryMenuPage(
            currentCategory: _currentCategory, onCategoryTap: _onCategoryTap),
        frontTitle: Text("SHRINE"),
        backTitle: Text("MENU"));
  }
}
