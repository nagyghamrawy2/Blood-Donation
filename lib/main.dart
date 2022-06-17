import 'package:blood_bank/layout/home_layout.dart';
import 'package:blood_bank/modules/Login_Screen/login.dart';
import 'package:blood_bank/modules/Sign_Up_with_gmail/Sign_up_with_gmail.dart';
import 'package:blood_bank/modules/add_request/addRequest.dart';
import 'package:blood_bank/modules/bloodBank/bloodBankScreen.dart';
import 'package:blood_bank/modules/editProfile/editProfile.dart';
import 'package:blood_bank/modules/education/education.dart';
import 'package:blood_bank/modules/education_article/Education_Article.dart';
import 'package:blood_bank/modules/findDonor/findDonorScreen.dart';
import 'package:blood_bank/modules/myInformation/myInformation.dart';
import 'package:blood_bank/modules/profile/profile.dart';
import 'package:blood_bank/modules/request/editRequest.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/modules/sign_up/SignUpForm2.dart';
import 'package:blood_bank/modules/sign_up/SignUpForm3.dart';
import 'package:blood_bank/modules/sign_up/cubit/SignUpForm.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/Network/Remote/dio_helper.dart';
import 'package:blood_bank/shared/bloc_observer.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:blood_bank/shared/styles/themes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'modules/Create_new_password/createNewPassword.dart';
import 'modules/Forget Password/forgetPasswordScreen.dart';
import 'modules/Verification/verificationScreen.dart';
import 'modules/change password/changePassword.dart';
import 'shared/Network/local/Cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  FirebaseMessaging.onMessage.listen((event) {
    print(event.data.toString());
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data.toString());
  });

  //na2s wa7da


  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token');
  govIdProfile = CacheHelper.getData(key: 'govId');
  cityIdProfile = CacheHelper.getData(key: 'cityId');
  Widget widget;
  if (token != null) {
    widget = HomeLayout();
  } else {
    widget = LoginScreen();
  }
  runApp(MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({Key? key, required this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(300, 1200),
      minTextAdapt: true,
      splitScreenMode: true, // a2dr aft7 2 app m3 b3d
      builder: () => BlocProvider(
        create: (context){
          if(token != null){
            if(govIdProfile != null){
              return AppCubit()..getUserData()..getEducationData()..getGovernorateData()..getMyRequests()..getAllRequests()..getClosedRequests()..getDonorData()..getCityData(id: govIdProfile!);
            }
            return AppCubit()..getUserData()..getEducationData()..getGovernorateData()..getMyRequests()..getAllRequests()..getClosedRequests()..getDonorData();
          }else{
            return AppCubit()..getGovernorateData();
          }
        },
        child: BlocConsumer<AppCubit, AppStates>(
          builder: (context, state) {
            return MaterialApp(
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
              home: startWidget,
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}