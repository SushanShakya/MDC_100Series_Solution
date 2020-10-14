import 'package:flutter/material.dart';
import 'package:mdc_102/Supplementary/cut_corners_border.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
        accentColor: kShrineBrown900,
        primaryColor: kShrinePink100,
        buttonTheme: base.buttonTheme.copyWith(
          buttonColor: kShrinePink100,
          colorScheme: base.colorScheme.copyWith(
            secondary: kShrineBrown900,
          ),
        ),
        buttonBarTheme: base.buttonBarTheme.copyWith(
          buttonTextTheme: ButtonTextTheme.accent,
        ),
        scaffoldBackgroundColor: kShrineBackgroundWhite,
        cardColor: kShrineBackgroundWhite,
        textSelectionColor: kShrinePink100,
        errorColor: kShrineErrorRed,
        inputDecorationTheme: InputDecorationTheme(
            border: CutCornersBorder(),
            focusedBorder: CutCornersBorder(
                borderSide: BorderSide(color: kShrineBrown900, width: 2.0))),
        textTheme: _buildShrineTextTheme(base.textTheme),
        primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
        accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
        primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900));
  }

  static ThemeData darkTheme() {
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      brightness: Brightness.dark,
      accentColor: kShrineBrown900,
      primaryColor: kShrinePink100,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kShrinePink100,
        colorScheme: base.colorScheme.copyWith(
          secondary: kShrineBrown900,
        ),
      ),
      buttonBarTheme: base.buttonBarTheme.copyWith(
        buttonTextTheme: ButtonTextTheme.accent,
      ),
      scaffoldBackgroundColor: kShrineBackgroundWhite,
      cardColor: kShrineBackgroundWhite,
      textSelectionColor: kShrinePink100,
      errorColor: kShrineErrorRed,
    );
  }

  static TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline5: base.headline5.copyWith(
            fontWeight: FontWeight.w500,
          ),
          headline6: base.headline6.copyWith(fontSize: 18.0),
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          bodyText1: base.bodyText1.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
          displayColor: kShrineBrown900,
          bodyColor: kShrineBrown900,
        );
  }
}
