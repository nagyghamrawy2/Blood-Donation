part of 'register_cubit.dart';

@immutable
abstract class RegisterStates {}

class RegisterInitial extends RegisterStates {}

class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  final ProfileModel registerModel;
 RegisterSuccessState(this.registerModel);
}
class RegisterErrorState extends RegisterStates{
  final String error;

  RegisterErrorState(this.error);
}

class PolicyTermsChangeState extends RegisterStates{}
class ChangeCheckValueState extends RegisterStates{}

class AppLoadingCityDataState extends RegisterStates{}

class AppLoadingErrorDataState extends RegisterStates{}
class AppSuccessErrorDataState extends RegisterStates{}
class AppErrorErrorDataState extends RegisterStates{}

class AppSuccessCityDataState extends RegisterStates{}
class AppErrorCityDataState extends RegisterStates{}
class ChangeConfirmPasswordState extends RegisterStates{}
class ChangePasswordState extends RegisterStates{}
