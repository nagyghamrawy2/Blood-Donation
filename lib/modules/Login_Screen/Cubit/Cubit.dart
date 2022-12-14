import 'package:blood_bank/models/fcm_model.dart';
import 'package:blood_bank/models/profile_model.dart';
import 'package:blood_bank/modules/Login_Screen/Cubit/States.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/Network/Remote/dio_helper.dart';
import 'package:blood_bank/shared/Network/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(AppLoginInitialState());

  static AppLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String Password}) {
    emit(AppLoginLoadingState());
    DioHelper.postData(
        url: LOGIN, data: {'email': email, 'password': Password}).then((value) {
      userDataModel = ProfileModel.fromJson(value.data);
      emit(AppLoginSuccessState(userDataModel!));
    }).catchError((error) {
      print(error.toString());
      emit(AppLoginFailedState(error.toString()));
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool ispassword=true;
  void ChangeIcon()
  {
    ispassword=!ispassword;
    suffix= ispassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AppChangeIconPasswordState());
  }
  bool obsecure = true;

  void changePasswordStatus() {
    obsecure = !obsecure;
    emit(changePasswordState());
  }

  FcmTokenModel? updateFcmToken;
  void updateFcmUserToken({
    required String fcmToken,
  }){
    emit(changeFcmLoadingState());
    DioHelper.putData(url: UPDATE_FCM_TOKEN,token: token  ,data: {
      "fcm_token" : fcmToken,
    }).then((value) {
       // updateFcmToken = FcmTokenModel.fromJson(value.data);
        print("Hello");
        print(value.data);
        emit(changeFcmSuccessState());
    }).catchError((error){
      print("xxxxxxxxxxx");
      print(error.toString());
      emit(changeFcmErrorState());
    });
  }
}
