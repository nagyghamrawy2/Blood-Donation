import 'dart:core';
import 'dart:io';
import 'package:blood_bank/models/governate_model.dart';
import 'package:blood_bank/models/profile_model.dart';
import 'package:blood_bank/models/user_model.dart';
import 'package:blood_bank/modules/add_request/addRequest.dart';
import 'package:blood_bank/modules/chat/messageModel.dart';
import 'package:blood_bank/modules/education/education.dart';
import 'package:blood_bank/modules/home/homeScreen.dart';
import 'package:blood_bank/modules/profile/profile.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/Network/Remote/dio_helper.dart';
import 'package:blood_bank/shared/Network/end_points.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../models/city_model.dart';

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

  List<String> bloodGroupItem = [
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

  void ChangeDropDownValue(String? value) {
    dropDownValue = value!;
    emit(ChangeDropDownValueState());
  }

  String? locationcityvalue;

  void ChangeLocationCityValue(String value) {
    locationcityvalue = value;
    // emit(ChangeLocationValueState());
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

  ProfileModel? profileModel;

  void getUserData() {
    emit(AppLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      print(value.data);
      print('hi');
      profileModel = ProfileModel.fromJson(value.data);
      print(profileModel?.status);
      print(profileModel?.user);
      print(profileModel?.errors);
      print('bye');
      emit(AppSuccessUserDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppErrorUserDataState());
    });
  }

  ProfileModel? updateProfileModel;

  void updateUserData({
    required String name,
    required String email,
    required String phone,
    required String dateOfBirth,
    String? profilePicture,
    String? lastDonateDate,
    required String bloodType,
    int? govId,
    int? cityId,
    required int height,
    required String weight,
  }) {
    emit(AppLoadingUpdateUserDataState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      data: {
        "name": name,
        "email": email,
        "phone_number": phone,
        "date_of_birth": dateOfBirth,
        // "profile_picture": profilePicture,
        "blood_type": bloodType,
        'last_donate_time': lastDonateDate,
        "height": height,
        "weight": weight,
        "governorate_id": 2,
        "city_id": 2
      },
      token: token,
    ).then((value) {
      print(value.data);
      profileModel = ProfileModel.fromJson(value.data);
      print('bye');
      emit(AppSuccessUpdateUserDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppErrorUpdateUserDataState());
    });
  }

  List<String> governorateItemList = [];

  late GovernorateModel governorateModel;

  void getGovernorateData() {
    emit(AppLoadingGovernorateDataState());
    DioHelper.getData(url: GOVERNORATE).then((value) {
      governorateModel = GovernorateModel.fromJson(value.data);
      governorateModel.governorates.forEach((e) {
        governorateItemList.add(e.governorateName);
      });
      emit(AppSuccessGovernorateDataState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorGovernorateDataState());
    });
  }

  //hesham 29/4
  List<String> cityItemList = [];
  late CityModel cityModel;
  void getCityData({required int id}) {
    emit(AppLoadingCityDataState());
    cityItemList.clear();
    DioHelper.getData(url: '$CITY/$id').then((value) {
      cityModel = CityModel.fromJson(value.data);
      cityModel.cities.forEach((e) {
        cityItemList.add(e.cityName);
      });
      print(cityItemList);
      emit(AppSuccessCityDataState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorCityDataState());
    });
  }

// void sendMessage({
//   required String reciverId,
//   required String date,
//   required String text,
// }) {
//   MessageModel model = MessageModel(
//       senderId: usermodel.uid, reciverId: reciverId, date: date, text: text);
//   FirebaseFirestore.instance
//       .collection('users')
//       .doc(usermodel.uid)
//       .collection("chats")
//       .doc(reciverId)
//       .collection("messages")
//       .add(model.toMap())
//       .then((value) {
//     emit(SendMessageSuccessState());
//   }).catchError((error) {
//     emit(SendMessageErrorState());
//   });
//   FirebaseFirestore.instance
//       .collection('users')
//       .doc(reciverId)
//       .collection("chats")
//       .doc(usermodel.uid)
//       .collection("messages")
//       .add(model.toMap())
//       .then((value) {
//     emit(SendMessageSuccessState());
//   }).catchError((error) {
//     emit(SendMessageErrorState());
//   });
// }
//
// List<MessageModel> messages = [];
//
// void getMessages({
//   required String reciverId,
// }) {
//   FirebaseFirestore.instance
//       .collection('users')
//       .doc(usermodel.uid)
//       .collection('chats')
//       .doc(reciverId)
//       .collection('messages')
//       .orderBy('datetime')
//       .snapshots()
//       .listen((event) {
//     messages = [];
//     event.docs.forEach((element) {
//       messages.add(MessageModel.fromJason(element.data()));
//     });
//     emit(GetMessagesSuccessState());
//   });
// }
}
