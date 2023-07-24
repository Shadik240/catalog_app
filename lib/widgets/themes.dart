import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6));

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData();

  //colors

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluisedColor = Color(0xff403b58);
}
