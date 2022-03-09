import 'package:blood_bank/layout/home_layout.dart';
import 'package:blood_bank/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'change password/Change_password.dart';
import 'shared/styles/colors.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: mainColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: mainColor,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeLayout(),
    );
  }
}
