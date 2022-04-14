import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: mainColor,
    elevation: 2,
  ),
  fontFamily: 'OpenSans',
  appBarTheme: const AppBarTheme(
    backgroundColor: mainColor,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedItemColor: Colors.black,
    selectedItemColor: mainColor,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  ),
);