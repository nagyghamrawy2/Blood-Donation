import 'package:blood_bank/layout/home_layout.dart';
import 'package:blood_bank/modules/profile/profile.dart';
import 'package:blood_bank/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Forget Password/Forget_password.dart';
import 'Login_Screen/Login_Screen.dart';
import 'change password/Change_password.dart';

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
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(237, 57, 74, 1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}
