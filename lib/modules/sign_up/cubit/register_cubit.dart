import 'package:bloc/bloc.dart';
import 'package:blood_bank/models/city_model.dart';
import 'package:blood_bank/models/register_model.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/Network/Remote/dio_helper.dart';
import 'package:blood_bank/shared/Network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  late RegisterModel registerModel;

  void userRegister({
    required String email,
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
    required int govId,
    required int cityId,
    required String dateOfBirth,
    required String bloodType,
    required String lastDonateTime,

  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'phone_number': phone,
        'password': password,
        'password_confirmation' : confirmPassword,
        'date_of_birth' : dateOfBirth,
        'blood_type' : bloodType,
        'last_donate_time' : lastDonateTime,
        'governorate_id' : govId,
        'city_id' : cityId ,
      },
    ).then((value) {
      print(value.data);
      registerModel = RegisterModel.fromJson(value.data);
      print(registerModel);
      emit(RegisterSuccessState(registerModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
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
  bool confirmObsecure = true;

  void changeConfirmPasswordStatus() {
    confirmObsecure = !confirmObsecure;
    emit(ChangeConfirmPasswordState());
  }
  bool obsecure = true;

  void changePasswordStatus() {
    obsecure = !obsecure;
    emit(ChangePasswordState());
  }

}
