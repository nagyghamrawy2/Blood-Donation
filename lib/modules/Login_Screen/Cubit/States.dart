
import 'package:blood_bank/models/user_model.dart';

abstract class AppLoginStates {}

class AppLoginInitialState extends AppLoginStates {}
class AppLoginLoadingState extends AppLoginStates {}
class AppLoginSuccessState extends AppLoginStates
{
   final UserModel login;

  AppLoginSuccessState(this.login);
}
class AppChangeIconPasswordState extends AppLoginStates {}
class AppLoginFailedState extends AppLoginStates {
  late final String error;

  AppLoginFailedState(String error);

}
class changePasswordState extends AppLoginStates {}


