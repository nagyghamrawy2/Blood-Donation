import 'dart:async';

import 'package:blood_bank/modules/Login_Screen/login.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class noInternetScreen extends StatefulWidget {
  const noInternetScreen({Key? key}) : super(key: key);

  @override
  State<noInternetScreen> createState() => _noInternetScreenState();
}

class _noInternetScreenState extends State<noInternetScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/noInternet.jpg",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(35),
                        child: Text(
                          "Please Check Your Connection",
                          style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp),
                        ),
                      )
                    ],
                  ),
                )


    );
  }
}
