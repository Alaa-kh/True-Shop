import 'package:flutter/material.dart';

const Color mainColor = Color(0xFF76549A);
const Color darkGreyClr = Color(0xFF121212);
const Color blueClr = Color(0xFF8FBDD3);
const Color kColor1 = Color(0xFF116D6E);
const Color kColor2 = Color(0xFFADA79B);
const Color kColor3 = Color(0xFFD9ACF5);
const Color kColor4 = Color(0xFF738B71);
const Color kColor5 = Color(0xFF6D454D);

const Color darkSettings = Color(0xFF6132e4);
const Color accountSettings = Color(0xFF73bc65);
const Color logOutSettings = Color(0xFF5f95ef);
const Color notiettings = Color(0xFFdf5862);
const Color languageSettings = Color(0xFFCB256C);

class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    canvasColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    canvasColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
