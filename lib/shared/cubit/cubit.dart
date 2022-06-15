import 'dart:core';
import 'dart:io';
import 'package:blood_bank/models/Donermodel.dart';
import 'package:blood_bank/models/city_model.dart';
import 'package:blood_bank/models/edit_request_model.dart';
import 'package:blood_bank/models/education_model.dart';
import 'package:blood_bank/models/filterDonors_model.dart';
import 'package:blood_bank/models/governate_model.dart';
import 'package:blood_bank/models/profile_model.dart';
import 'package:blood_bank/models/request_model.dart';
import 'package:blood_bank/modules/add_request/addRequest.dart';
import 'package:blood_bank/models/messageModel.dart';
import 'package:blood_bank/modules/education/education.dart';
import 'package:blood_bank/modules/home/homeScreen.dart';
import 'package:blood_bank/modules/profile/profile.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/Network/Remote/dio_helper.dart';
import 'package:blood_bank/shared/Network/end_points.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:flutter/cupertino.dart';
import 'package:blood_bank/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  int? valueSwitch;

  void changeValueSwitch(int value) {
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
  bool bloodCheck = true;
  void changeBloodValue(int value) {
    bloodGroup = value;
    emit(BloodValueChangeState());
  }

  void changeBloodCheck() {
    if (bloodGroup != -1) {
      bloodCheck = true;
      emit(ChangeBloodCheckValueState());
    } else {
      bloodCheck = false;
      emit(ChangeBloodCheckValueState());
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

  void getUserData() {
    emit(AppLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      print(value.data);
      userDataModel = ProfileModel.fromJson(value.data);
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
    File? profilePicture,
    String? lastDonateDate,
    required String bloodType,
    required int govId,
    required int cityId,
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
         "profile_picture": profilePicture,
        "blood_type": bloodType,
        'last_donate_time': lastDonateDate,
        "height": height,
        "weight": weight,
        "governorate_id": govId,
        "city_id": cityId
      },
      token: token,
    ).then((value) {
      print(value.data);
      userDataModel = ProfileModel.fromJson(value.data);
      print('bye');
      emit(AppSuccessUpdateUserDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppErrorUpdateUserDataState());
    });
  }

  late GovernorateModel governorateModel;

  void getGovernorateData() {
    emit(AppLoadingGovernorateDataState());
    DioHelper.getData(url: GOVERNORATE).then((value) {
      governorateModel = GovernorateModel.fromJson(value.data);
      governorateModel.governorates?.forEach((e) {
        governorateItemList.add(e);
      });
      emit(AppSuccessGovernorateDataState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorGovernorateDataState());
    });
  }

  late CityModel cityModel;

  void getCityData({required int id}) {
    emit(AppLoadingCityDataState());
    cityItemList.clear();
    DioHelper.getData(url: '$CITY/$id').then((value) {
      cityModel = CityModel.fromJson(value.data);
      cityModel.cities?.forEach((e) {
        cityItemList.add(e);
      });
      emit(AppSuccessCityDataState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorCityDataState());
    });
  }

  late CityModel cityEditRequestModel;
  List<Cities> cityEditRequestItemList = [];

  void getCityEditRequestData({required int id}) {
    emit(AppLoadingCityEditRequestDataState());
    cityEditRequestItemList.clear();
    DioHelper.getData(url: '$CITY/$id').then((value) {
      cityEditRequestModel = CityModel.fromJson(value.data);
      cityEditRequestModel.cities?.forEach((e) {
        cityEditRequestItemList.add(e);
      });
      print(cityEditRequestItemList);
      emit(AppSuccessCityEditRequestDataState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorCityEditRequestDataState());
    });
  }

  late CityModel filterCityModel;
  List<Cities> filterCityItemList = [];

  void getFilterCityData({required int id}) {
    emit(AppLoadingFilterCityDataState());
    filterCityItemList.clear();
    DioHelper.getData(url: '$CITY/$id').then((value) {
      filterCityModel = CityModel.fromJson(value.data);
      filterCityModel.cities?.forEach((e) {
        filterCityItemList.add(e);
      });
      print(filterCityItemList);
      emit(AppSuccessFilterCityDataState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorFilterCityDataState());
    });
  }

  List<Cities> cityRequestItemList = [];
  late CityModel cityRequestModel;

  void getCityRequestData({required int id}) {
    emit(AppLoadingCityRequestDataState());
    cityRequestItemList.clear();
    DioHelper.getData(url: '$CITY/$id').then((value) {
      cityRequestModel = CityModel.fromJson(value.data);
      cityRequestModel.cities?.forEach((e) {
        cityRequestItemList.add(e);
      });
      emit(AppSuccessCityRequestDataState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorCityRequestDataState());
    });
  }

  void getAllRequests() {
    emit(AppLoadingAllRequestsDataState());
    DioHelper.getData(url: REQUESTS, token: token).then((value) {
      requestModel = RequestModel.fromJson(value.data);
      print(value.data);
      emit(AppSuccessAllRequestsDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppErrorAllRequestsDataState());
    });
  }

  void getClosedRequests() {
    emit(AppLoadingClosedRequestsDataState());
    DioHelper.getData(url: CLOSED_REQUESTS, token: token).then((value) {
      closedRequestModel = RequestModel.fromJson(value.data);
      print('closed request tttttttttttttttttttttttttttttttttttttttt');
      print(value.data);
      emit(AppSuccessClosedRequestsDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppErrorClosedRequestsDataState());
    });
  }

  void getMyRequests() {
    emit(AppLoadingMyRequestsDataState());
    DioHelper.getData(url: MY_REQUESTS, token: token).then((value) {
      myRequestModel = RequestModel.fromJson(value.data);
      print(value.data);
      emit(AppSuccessMyRequestsDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppErrorMyRequestsDataState());
    });
  }

  void deleteMyRequests({required int id}) {
    emit(AppLoadingDeleteMyRequestsDataState());
    DioHelper.deleteData(url: '$REQUESTS/$id', token: token).then((value) {
      myRequestModel?.requests?.removeWhere((item) => item.id == id);
      requestModel?.requests?.removeWhere((item) => item.id == id);
      emit(AppSuccessDeleteMyRequestsDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppErrorDeleteMyRequestsDataState());
    });
  }

  void changeStatueForRequest(int idRequest){
    emit(AppLoadingChangeStatueForMyRequestsDataState());
    DioHelper.getData(url: '${CHANGE_STATUE_REQUESTS}/$idRequest',token: token).then((value){
      emit(AppSuccessChangeStatueForMyRequestsDataState());
    }).catchError((onError){
      print(onError.toString());
      emit(AppErrorChangeStatueForMyRequestsDataState());
    });
  }

  void changeAvailability({required int value}) {
    DioHelper.putData(
        url: CHANGE_AVAILABILITY,
        token: token,
        data: {'available_for_donate': value}).then((value) {
      print(value.data);
      emit(AppSuccessChangeAvailabilityState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppErrorChangeAvailabilityState());
    });
  }

  void postRequest({
    required String title,
    required String description,
    required String phone,
    required String numberOfBags,
    required String expiredDate,
    required String bloodType,
    required String govId,
    required String cityId,
    required String hospitalName,
    required String hospitalAddress,
  }) {
    emit(AppLoadingPostRequestsDataState());
    DioHelper.postData(url: ADD_REQUEST, token: token, data: {
      'title': title,
      'description': description,
      'phone_number': phone,
      'no_of_bags': numberOfBags,
      'request_expiredDate': expiredDate,
      'blood_type': bloodType,
      'governorate_id': govId,
      'city_id': cityId,
      'hosp_name': hospitalName,
      'hosp_address': hospitalAddress,
    }).then((value) {
      print(value.data);
      emit(AppSuccessPostRequestsDataState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorPostRequestsDataState());
    });
  }

  void updateRequest({
    required String title,
    required String description,
    required String phone,
    required String numberOfBags,
    required String expiredDate,
    required String bloodType,
    required String govId,
    required String cityId,
    required int id,
  }) {
    emit(AppLoadingUpdateRequestsDataState());
    DioHelper.putData(
      url: '$UPDATE_REQUESTS/$id',
      data: {
        'title': title,
        'description': description,
        'phone_number': phone,
        'no_of_bags': numberOfBags,
        'request_expiredDate': expiredDate,
        'blood_type': bloodType,
        'governorate_id': govId,
        'city_id': cityId,
      },
      token: token,
    ).then((value){
      print(value.data);
      emit(AppSuccessUpdateRequestsDataState());
    }).catchError((onError){
      print(onError.toString());
      emit(AppErrorUpdateRequestsDataState());
    });
  }

  EducationModel? educationModel;
  List<EducationData> educationItemData = [];

  void getEducationData() {
    emit(AppLoadingEducationDataState());
    DioHelper.getData(url: EDUCATION, token: token).then((value) {
      educationModel = EducationModel.fromJson(value.data);
      educationModel?.posts?.forEach((element) {
        educationItemData.add(element);
      });
      print(educationItemData);
      emit(AppSuccessEducationDataState());
      // print(educationItemData);
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorEducationDataState());
    });
  }

  void sendMessage({
    required String receiverId,
    required String date,
    required String text,
  }) {
    MessageModel model = MessageModel(
        senderId: userDataModel?.user?.id,
        receiverId: receiverId.toString(),
        date: date,
        text: text);
    FirebaseFirestore.instance
        .collection('users')
        .doc(userDataModel?.user?.id.toString())
        .collection("chats")
        .doc(receiverId)
        .collection("messages")
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection("chats")
        .doc(userDataModel?.user?.id.toString())
        .collection("messages")
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userDataModel?.user?.id.toString())
        .collection("chats")
        .doc(receiverId)
        .collection("messages")
        .orderBy('date')
        .snapshots()
        .listen((event) {
      messages = [];
      for (var element in event.docs) {
        messages.add(MessageModel.fromJason(element.data()));
      }
      emit(GetMessagesSuccessState());
    });
  }

  late DonarModel donorModel;

  void getDonorData() {
    emit(AppLoadingDonorDataState());
    DioHelper.getData(url: DONORDATA, token: token).then((value) {
      donorModel = DonarModel.fromJson(value.data);
      emit(AppSuccessDonorDataState());
    }).catchError((error) {
      emit(AppErrorDonorDataState());
    });
  }

  // FilterDonorModel? filterDonorModel;
  void filterDonor({
    required String bloodType,
    required int govId,
    required int cityId,
  }) {
    emit(AppLoadingFilterDonorState());
    DioHelper.postData(url: FILTER_DONORS, token: token, data: {
      'blood_type': bloodType,
      'governorate_id': govId,
      'city_id': cityId
    }).then((value) {
      print(value.data);
      donorModel = DonarModel.fromJson(value.data);
      print(donorModel);
      print(donorModel.users);
      emit(AppSuccessFilterDonorState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppErrorFilterDonorState());
    });
  }
}
