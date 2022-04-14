import 'dart:core';
import 'dart:io';
import 'package:blood_bank/modules/add_request/addRequest.dart';
import 'package:blood_bank/modules/education/education.dart';
import 'package:blood_bank/modules/home/homeScreen.dart';
import 'package:blood_bank/modules/profile/profile.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool valueSwitch = false;

  void changeValueSwitch(bool value) {
    valueSwitch = value;
    emit(AppChangeSwitchValueState());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const RequestScreen(),
    // const EducationScreen(),
    //const ProfileScreen(),
  ];

  List<String> titles = [
    'Home',
    'Requests',
    'Education',
    'Profile',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBotNavBarState());
  }

  List<String> blood_group_item = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-"
  ];

  int bloodGroup = -1;

  void changeBloodValue(int value) {
    bloodGroup = value;
    emit(BloodValueChangeState());
  }

  bool policyTerms = false;

  void acceptPolicy(bool value) {
    policyTerms = value;
    emit(PolicyTermsChangeState());
  }

  bool obsecure = true;

  void changePasswordStatus() {
    obsecure = !obsecure;
    emit(ChangePasswordState());
  }
  Color activecolor=mainColor;
  void changeactiveStatus(value) {
    activecolor= Colors.amberAccent;
    value = !value;

    emit(ChangeactiveState());
  }

  String dropDownValue = "A+";

  void ChangeDropDownValue(String? value) {
    dropDownValue = value!;
    emit(ChangeDropDownValueState());
  }

  String locationcityvalue = 'Cairo';
  List<String> location__item = [
    "Cairo",
    "Alex",
    "Mansoura",
    "tanta",
    "mnofya",
    "dkahlya",
    "embaba",
    "helwan",
    "ma",
    "hen",
    "heaswan",
    "helwsadasdasdan",
    "helwfffffan",
    "helwaggn",
    "helwhhhhhan","hejjjjlwan",
    "helwasfdasdfasan",
    "helwcxvcvan",
    "helwcxvcxan",
    "helwcxvan",
    "helwavxcxcvn","heladsfwan","hesadlwan","heldasdaswwdan","hewdasdlwan","hwdawdelwan","helwawdadn","helwdawdwan","helwdwadan","helwdwdawdan","hewdaalwan","hewdaawdlwan","helwadwadawn","helwadwan",
  ];
  void ChangeLocationCityValue(String? value) {
    locationcityvalue = value!;
    emit(ChangeLocationValueState());
  }

  ImagePicker a=new ImagePicker();
  dynamic x;
  void CameraImage()async{
    dynamic b =await a.pickImage(source: ImageSource.camera);
    x = File(b.path);
    emit(ChangeCameraValueState());
  }
  void GalleryImage()async{
    dynamic b =await a.pickImage(source: ImageSource.gallery);
    x = File(b.path);
    emit(ChangeGalleryValueState());
  }


}
