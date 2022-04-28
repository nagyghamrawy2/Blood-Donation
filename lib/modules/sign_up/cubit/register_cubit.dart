import 'package:bloc/bloc.dart';
import 'package:blood_bank/models/user_model.dart';
import 'package:blood_bank/shared/Network/Remote/dio_helper.dart';
import 'package:blood_bank/shared/Network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  late UserModel userModel;

  void userRegister({
    required String email,
    required String name,
    required String phone,
    required String password,
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
        'phone': phone,
        'password': password,
        'date_of_birth' : dateOfBirth,
        'blood_type' : bloodType,
        'last_donate_time' : lastDonateTime,
      },
    ).then((value) {
      print(value.data);
      userModel = UserModel.fromJson(value.data);
      emit(RegisterSuccessState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }


}
