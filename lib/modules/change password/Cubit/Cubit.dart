import 'package:blood_bank/models/profile_model.dart';
import 'package:blood_bank/modules/Login_Screen/Cubit/States.dart';
import 'package:blood_bank/modules/change%20password/Cubit/States.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/Network/Remote/dio_helper.dart';
import 'package:blood_bank/shared/Network/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppChangePasswordCubit extends Cubit<AppChangePasswordStates> {
  AppChangePasswordCubit() : super(AppChangePasswordInitialState());

  static AppChangePasswordCubit get(context) => BlocProvider.of(context);
  late ProfileModel changePassword;

  void ChangePassword({required String oldPassword,
    required String newPassword,
    required String confirmPassword}) {
    emit(AppChangePasswordLoadingState());
    DioHelper.postData(url: CHANGEPASSWORD, token: token,
        data: {
          'oldPassword': oldPassword,
          'password': newPassword,
          'password_confirmation': confirmPassword
        }).then((value) {
      print(value.data);
      changePassword = ProfileModel.fromJson(value.data);
      emit(AppChangePasswordSuccessState(changePassword));
    }).catchError((error) {
      print(error.toString());
      emit(AppChangePasswordFailedState(error.toString()));
    });
  }
IconData suffix = Icons.visibility_outlined;
bool ispassword=true;
void ChangeIcon()
{
  ispassword=!ispassword;
  suffix= ispassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  emit(appChangeIconPasswordState());
}
bool obsecure = true;
void changePasswordStatus() {
  obsecure = !obsecure;
  emit(changePassworddState());
}
  bool obsecureNew = true;
  void changeNewPasswordStatus() {
    obsecureNew = !obsecureNew;
    emit(changeNewPassworddState());
  }
  bool obsecureConfirm = true;
  void changeConfirmPasswordStatus() {
    obsecureConfirm = !obsecureConfirm;
    emit(changeConfirmPassworddState());
  }
}