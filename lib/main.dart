import 'package:blood_bank/layout/home_layout.dart';
import 'package:blood_bank/modules/Sign_Up_with_gmail/Sign_up_with_gmail.dart';
import 'package:blood_bank/modules/bloodBank/bloodBankScreen.dart';
import 'package:blood_bank/modules/editProfile/editProfile.dart';
import 'package:blood_bank/modules/education/education.dart';
import 'package:blood_bank/modules/education_article/Education_Article.dart';
import 'package:blood_bank/modules/findDonor/findDonorScreen.dart';
import 'package:blood_bank/modules/home/home.dart';
import 'package:blood_bank/modules/myInformation/myInformation.dart';
import 'package:blood_bank/modules/profile/profile.dart';
import 'package:blood_bank/modules/request/editRequest.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/modules/sign_up/SignUpForm.dart';
import 'package:blood_bank/shared/Network/Remote/dio_helper.dart';
import 'package:blood_bank/shared/bloc_observer.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:blood_bank/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'modules/add_request/Add_Request.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
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
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeLayout(),
      );
  }
}
