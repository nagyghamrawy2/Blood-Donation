import 'package:blood_bank/layout/home_layout.dart';
import 'package:blood_bank/modules/Login_Screen/login.dart';
import 'package:blood_bank/modules/Sign_Up_with_gmail/Sign_up_with_gmail.dart';
import 'package:blood_bank/modules/bloodBank/bloodBankScreen.dart';
import 'package:blood_bank/modules/editProfile/editProfile.dart';
import 'package:blood_bank/modules/education/education.dart';
import 'package:blood_bank/modules/education_article/Education_Article.dart';
import 'package:blood_bank/modules/findDonor/findDonorScreen.dart';

import 'package:blood_bank/modules/myInformation/myInformation.dart';
import 'package:blood_bank/modules/profile/profile.dart';
import 'package:blood_bank/modules/request/editRequest.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/modules/sign_up/SignUpForm.dart';
import 'package:blood_bank/modules/sign_up/SignUpForm2.dart';
import 'package:blood_bank/modules/sign_up/SignUpForm3.dart';
import 'package:blood_bank/shared/Network/Remote/dio_helper.dart';
import 'package:blood_bank/shared/bloc_observer.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:blood_bank/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(300, 1200),
      minTextAdapt: true,
      splitScreenMode: true, // a2dr aft7 2 app m3 b3d
      builder: () => BlocProvider(
        create: (context) => AppCubit(),
        child: MaterialApp(
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            // elle hwa lma tege t3ml ay t8yeer msln t8yeer el5t myt2sr4
            ScreenUtil.setContext(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          home: FindDonorScreen(),
        ),
      ),
    );
  }
}
