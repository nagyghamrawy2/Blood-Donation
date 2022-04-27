import 'package:blood_bank/models/register_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}
class AppChangeBotNavBarState extends AppStates{}
class AppChangeSwitchValueState extends AppStates{}
class ColorChangeValueState extends AppStates{}
class BloodValueChangeState extends AppStates{}
class PolicyTermsChangeState extends AppStates{}
class ChangePasswordState extends AppStates {}
class ChangeConfirmPasswordState extends AppStates {}
class ChangeActiveState extends AppStates {}
class ChangeDropDownValueState extends AppStates{}
class ChangeLocationValueState extends AppStates{}
class ChangeCameraValueState extends AppStates{}
class ChangeGalleryValueState extends AppStates{}
class ChangeCheckValueState extends AppStates{}
class SendMessageSuccessState extends AppStates{}
class SendMessageErrorState extends AppStates{}
class GetMessagesSuccessState extends AppStates{}
class AppLoadingUserDataState extends AppStates{}
class AppSuccessUserDataState extends AppStates{}
class AppErrorUserDataState extends AppStates{}

