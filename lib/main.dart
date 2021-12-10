import 'package:flutter/material.dart';

import 'remember_theme.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildTheme(),
      debugShowCheckedModeBanner: false,
      home: Remember(),
    );
  }
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kPrimary,
      secondary: kSecondary,
      surface: kSurface,
      error: kError,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onBackground: onBackground,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: _buildTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Colors.blue,
    ),
    // ignore: prefer_const_constructors
    inputDecorationTheme: InputDecorationTheme(
      // focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     width: 2.0,
      //     color: Colors.lightBlue,
      //   ),
      // ),
      // ignore: prefer_const_constructors
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          // màu này không ảnh hưởng?
          color: Colors.red,
        ),
      ),
      // filled: true,
      // fillColor: Colors.red.withOpacity(0.2),
    ),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        // fontFamily: 'Arial',
        displayColor: kPrimary,
        bodyColor: onBackground,
      );
}
