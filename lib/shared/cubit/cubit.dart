import 'dart:core';
import 'package:blood_bank/modules/add_request/Add_Request.dart';
import 'package:blood_bank/modules/education/education.dart';
import 'package:blood_bank/modules/home/home.dart';
import 'package:blood_bank/modules/profile/profile.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool valueSwitch = false;
  void changeValueSwitch(bool value){
    valueSwitch = value;
    emit(AppChangeSwitchValueState());
  }

  List<Widget> screens =[
    const HomeScreen(),
    const RequestScreen(),
    // const EducationScreen(),
    const ProfileScreen(),
  ];

  List<String> titles = [
    'Home',
    'Requests',
    'Education',
    'Profile',
  ];
  void changeIndex(int index){
    currentIndex = index;
    emit(AppChangeBotNavBarState());
  }

  // List<String> blood_group_item = [
  //   "A+",
  //   "A-",
  //   "B+",
  //   "B-",
  //   "O+",
  //   "O-",
  //   "AB+",
  //   "AB-"
  // ];

  int bloodGroup = -1;

  void changeBloodValue(int value){
    bloodGroup = value;
    emit(BloodValueChangeState());
  }


  bool policyTerms = false;
  void acceptPolicy (bool value){
    policyTerms = value;
    emit(PolicyTermsChangeState());
  }

  bool obsecure = true;
  void changePasswordStatus(){
    obsecure = !obsecure;
    emit(ChangePasswordState());
  }

  // String dropDownValue = AppCubit().blood_group_item[0];
  //
  // void ChangeDropDownValue(String? value){
  //   dropDownValue = value!;
  //   emit(ChangeDropDownValueState());
  // }

}