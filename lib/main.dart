import 'package:blood_bank/layout/home_layout.dart';
import 'package:flutter/material.dart';
import 'change password/Change_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //237, 57, 74,
        primarySwatch: Colors.blue,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(237, 57, 74, 1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ChangePasswordScreen(),
    );
  }
}
