import 'dart:core';
import 'dart:io';
import 'package:blood_bank/models/register_model.dart';
import 'package:blood_bank/models/user_model.dart';
import 'package:blood_bank/modules/add_request/addRequest.dart';
import 'package:blood_bank/modules/education/education.dart';
import 'package:blood_bank/modules/home/homeScreen.dart';
import 'package:blood_bank/modules/profile/profile.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/shared/Network/Remote/dio_helper.dart';
import 'package:blood_bank/shared/Network/end_points.dart';
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
    const EducationScreen(),
    const ProfileScreen(),
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

  bool check = true;

  void ChangeCheck() {
    if (policyTerms == true) {
      check = true;
      emit(ChangeCheckValueState());
    } else {
      check = false;
      emit(ChangeCheckValueState());
    }
  }

  bool obsecure = true;

  void changePasswordStatus() {
    obsecure = !obsecure;
    emit(ChangePasswordState());
  }

  bool confirmObsecure = true;

  void changeConfirmPasswordStatus() {
    confirmObsecure = !confirmObsecure;
    emit(ChangeConfirmPasswordState());
  }


  Color activecolor = mainColor;

  void changeactiveStatus(value) {
    activecolor = Colors.amberAccent;
    value = !value;

    emit(ChangeActiveState());
  }

  String? dropDownValue;

  List<String> drop_down_blood_group_item = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-"
  ];

  void ChangeDropDownValue(String? value) {
    dropDownValue = value!;
    emit(ChangeDropDownValueState());
  }

  String? locationcityvalue;
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
    "helwhhhhhan",
    "hejjjjlwan",
    "helwasfdasdfasan",
    "helwcxvcvan",
    "helwcxvcxan",
    "helwcxvan",
    "helwavxcxcvn",
    "heladsfwan",
    "hesadlwan",
    "heldasdaswwdan",
    "hewdasdlwan",
    "hwdawdelwan",
    "helwawdadn",
    "helwdawdwan",
    "helwdwadan",
    "helwdwdawdan",
    "hewdaalwan",
    "hewdaawdlwan",
    "helwadwadawn",
    "helwadwan",
  ];

  void ChangeLocationCityValue(String? value) {
    locationcityvalue = value!;
    emit(ChangeLocationValueState());
  }

  ImagePicker a = new ImagePicker();
  dynamic x;

  void CameraImage() async {
    dynamic b = await a.pickImage(source: ImageSource.camera);
    x = File(b.path);
    emit(ChangeCameraValueState());
  }

  void GalleryImage() async {
    dynamic b = await a.pickImage(source: ImageSource.gallery);
    x = File(b.path);
    emit(ChangeGalleryValueState());
  }
  // userModel? model;
  Response? model;

  void getUserData() {
    emit(AppLoadingUserDataState());
    DioHelper.postData(
      url: USER_DATA,
      token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vYmxvb2QtYmFuazIwMjIuaGVyb2t1YXBwLmNvbS9hcGkvdjEvbG9naW4iLCJpYXQiOjE2NTA3NDI0NjIsImV4cCI6NTU2NTA3NDI0NjIsIm5iZiI6MTY1MDc0MjQ2MiwianRpIjoiN2ZKVE1jWUdkVUl1ejZSOSIsInN1YiI6IjUiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.v-VnmKz8Xc812w2ybUm_xbdtMAYfjUXBxZQ2ghKkEtg',
    ).then((value) {
      print(value.data);
      print('hi');
      model = Response.fromJson(value.data);
      print(model!.message);
      print('bye');
      emit(AppSuccessUserDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppErrorUserDataState());
    });
  }

  UserModel? registerModel;

  void registerData() {
    emit(AppLoadingUserDataState());
    DioHelper.postData(
      url: 'register',
      data: {
        "name": "hesham ahmed",
        "email": "atch71@gmail.com",
        "phone_number": "0106331875",
        "password": '123456Ha@',
        "password_confirmation": '123456Ha@',
        "date_of_birth": "1996-07-7",
        "blood_type": "A+",
        "governorate_id": "1",
        "city_id": "2",
        "last_donate_time": "2022-1-7",
      }

    ).then((value) {
      print(value.data);
      print('hi');
      registerModel = UserModel.fromJson(value.data);
      print(registerModel!.status);
      print(registerModel!.message);
      print(registerModel!.errors);
      print(registerModel!.user);
      print('bye');
      emit(AppSuccessUserDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppErrorUserDataState());
    });
  }
  UserModel? LoginModel;

  void LoginData() {
    emit(AppLoadingUserDataState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          "email": "atch71@gmail.com",
          "password": '123456Ha@',
        }

    ).then((value) {
      print(value.data);
      print('hi');
      LoginModel = UserModel.fromJson(value.data);
      print(LoginModel!.status);
      print(LoginModel!.message);
      print(LoginModel!.errors);
      print(LoginModel!.user);
      print('bye');
      emit(AppSuccessUserDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppErrorUserDataState());
    });
  }
}
