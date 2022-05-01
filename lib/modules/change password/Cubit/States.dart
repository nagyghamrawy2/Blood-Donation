import 'package:blood_bank/models/profile_model.dart';

abstract class AppChangePasswordStates {}

class AppChangePasswordInitialState extends AppChangePasswordStates {}
class AppChangePasswordLoadingState extends AppChangePasswordStates {}
class AppChangePasswordSuccessState extends AppChangePasswordStates
{
  final ProfileModel changePassword;

  AppChangePasswordSuccessState(this.changePassword);
}
class appChangeIconPasswordState extends AppChangePasswordStates {}
class AppChangePasswordFailedState extends AppChangePasswordStates {
  late final String error;

  AppChangePasswordFailedState(String error);

}
class changePassworddState extends AppChangePasswordStates {}
class changeNewPassworddState extends AppChangePasswordStates {}
class changeConfirmPassworddState extends AppChangePasswordStates {}






