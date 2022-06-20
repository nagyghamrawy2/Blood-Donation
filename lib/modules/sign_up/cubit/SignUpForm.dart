import 'package:blood_bank/layout/home_layout.dart';
import 'package:blood_bank/modules/Login_Screen/login.dart';
import 'package:blood_bank/modules/sign_up/cubit/register_cubit.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';

import '../../../shared/Network/local/Cache_helper.dart';
import '../../../shared/cubit/cubit.dart';
import '../../Login_Screen/Cubit/Cubit.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var emailAddress = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var phone =  TextEditingController();
  var birthDate =  TextEditingController();
  var bloodType = TextEditingController();
  var lastDonationDate =  TextEditingController();
  String? fcmToken;
  int? id;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getToken().then((value){
      print(value);
      setState((){
        fcmToken = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if(state is RegisterSuccessState)
          {
            if(state.registerModel.status!)
            {
              ShowToast(state: ToastStates.SUCCESS , text: "Register successfully" );
              govIdProfile = userDataModel?.user?.governorate?.id;
              cityIdProfile = (userDataModel?.user?.city?.id)!;
              AppCubit.get(context).valueSwitch = userDataModel?.user?.availableForDonate;
              AppCubit.get(context).getCityData(id: govIdProfile!);
              CacheHelper.saveData(
                  key: 'govId', value: state.registerModel.user?.governorate?.id);
              CacheHelper.saveData(
                  key: 'cityId', value: state.registerModel.user?.city?.id);
              token = state.registerModel.user!.token!;
              CacheHelper.saveData(key: 'token', value: state.registerModel.user?.token);
              AppCubit.get(context)..getEducationData()..getDonorData()..getAllRequests()..getMyRequests()..getClosedRequests();
              if(token != null){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeLayout()), (route) => false);
              }
            } else{
              if(state.registerModel.errors?.email != null) {
                ShowToast(state: ToastStates.ERROR,location: ToastGravity.CENTER, text: "${state.registerModel.errors?.email![0]}");
              }
              if(state.registerModel.errors?.phoneNumber != null) {
                ShowToast(state: ToastStates.ERROR, location: ToastGravity.CENTER,text: "${state.registerModel.errors?.phoneNumber![0]}");
              }
            }
          }
        },
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 450.h,
                      color: mainColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hello,',
                            style: TextStyle(
                                fontSize: 50.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            'Sign Up ',
                            style: TextStyle(
                                fontSize: 50.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    clipper: CustomClipPath(),
                  ),
                  Form(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.of(context).size.width * 0.08),
                        child: Column(
                          children: [
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.008,
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.008,
                            ),
                            SignupTextField(
                              hintText: 'Enter your name',
                              text: 'Name',
                              controller: name,
                              keyboardtype: TextInputType.text,
                              validatorFunction: (value){
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                              },
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.008,
                            ),
                            SignupTextField(
                              hintText: 'Enter your email',
                              text: 'Email',
                              controller: emailAddress,
                              keyboardtype: TextInputType.emailAddress,
                              validatorFunction: (value){
                                // return emailValidator ;
                                if (value == null || value.isEmpty) {
                                  return "Please enter your email";
                                }
                                if(!EmailValidator.validate(value)){
                                  return 'Invalid Email Address';
                                }
                              },
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.008,
                            ),
                            SignupTextField(
                              hintText: 'Enter your password',
                              text: 'Password',
                              controller: password,
                              keyboardtype: TextInputType.visiblePassword,
                              validatorFunction: (value){
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if(value.length <8){
                                  return 'Password must be more than 8 characters';
                                }else{
                                  if(!validatePassword(value)){
                                    return 'Password must contain upper,lower,digit and Special character';
                                  }
                                }

                              },
                              isPasswordField: true,
                              secure: cubit.obsecure,
                              suffixFunction: () {
                                cubit.changePasswordStatus();
                              },
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.008,
                            ),
                            SignupTextField(
                              hintText: 'Enter password again',
                              text: 'Confirm Password',
                              controller: confirmPassword,
                              keyboardtype: TextInputType.visiblePassword,
                              validatorFunction: (value){
                                if (value == null || value.isEmpty) {
                                  return 'Please re-enter password again';
                                }
                                if(password.text!=confirmPassword.text){
                                  return "Password does not match";
                                }
                              },
                              isPasswordField: true,
                              secure: cubit.confirmObsecure,
                              suffixFunction: () {
                                cubit.changeConfirmPasswordStatus();
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SignupTextField(
                              hintText: 'Enter your phone number',
                              text: 'Phone Number',
                              controller: phone,
                              keyboardtype: TextInputType.phone,
                              validatorFunction: (value){
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                if(value.length != 11){
                                  return "Please enter valid phone";
                                }
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.008,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Birth Date",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.008,
                                ),
                                TextFormField(
                                  readOnly: true,
                                  keyboardType: TextInputType.datetime,
                                  controller: birthDate,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Date must not be empty';
                                    }
                                    else {
                                      birthDate.text = value;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    focusColor: Colors.green,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: greyColor,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    hintText: "Date",
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.calendar_today,
                                    ),
                                  ),
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.parse('2004-12-01'),
                                      firstDate: DateTime(1957),
                                      lastDate: DateTime.parse('2004-12-31'),
                                    ).then((value) {
                                      birthDate.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(value!);
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.008,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Governorate",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.005,
                            ),
                            DropdownButtonFormField(
                              hint: const Text(
                                'Governorate',
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "Governorate must not be empty";
                                }
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.green,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: greyColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Colors.red, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: governorateItemList
                                  .asMap()
                                  .entries
                                  .map((items) {
                                return DropdownMenuItem(
                                  value: items.value.governorateName,
                                  child: Text(items.value.governorateName!),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                id = governorateItemList.indexWhere(
                                        (element) => element.governorateName == newValue);
                                // govId = cubit.governorateItemList[id!].id;
                                govIdProfile = governorateItemList[id!].id;
                                cubit.getCityData(id: govIdProfile!);
                                print(id);
                                // print(govId);
                                print(govIdProfile);
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.008,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "City",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27.sp,
                                ),
                              ),
                            ),
                            ConditionalBuilder(
                              condition: cityItemList.isNotEmpty,
                              builder: (context) => DropdownButtonFormField(
                                  hint: const Text(
                                    'City',
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return "City must not be empty";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    focusColor: Colors.green,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: greyColor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items:
                                  cityItemList.asMap().entries.map((items) {
                                    return DropdownMenuItem(
                                      value: items.value.cityName,
                                      child: Text(items.value.cityName!),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    int id = cityItemList.indexWhere(
                                            (element) => element.cityName == newValue);
                                    cityIdProfile = (cityItemList[id].id)!;
                                    // print(govId);
                                    // print(govIdConstant);
                                  }),
                              fallback: (context) => Center(
                                child: CircularProgressIndicator(
                                  color: mainColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Blood type",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.004,
                            ),
                            DropdownButtonFormField<String>(
                              items: cubit.bloodGroupItem
                                  .map((label) => DropdownMenuItem(
                                child: Text(
                                  label,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                value: label,
                              ))
                                  .toList(),
                              onChanged: (value) {
                                bloodType.text = value!;
                              },
                              validator: (value) {
                                if (value == null) {
                                  return "Blood type must not be empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.green,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: greyColor,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              hint: const Text('Blood type'),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.008,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Last Donation Date",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27.sp,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.008,
                                ),
                                TextFormField(
                                  readOnly: true,
                                  keyboardType: TextInputType.datetime,
                                  controller: lastDonationDate,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Date must not be empty';
                                    } else {
                                      lastDonationDate.text = value;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    focusColor: Colors.green,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: greyColor,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    hintText: "Date",
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.calendar_today,
                                    ),
                                  ),
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2018),
                                      lastDate: DateTime.now(),
                                    ).then((value) {
                                      lastDonationDate.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(value!);
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.008,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Checkbox(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    ),
                                    activeColor: mainColor,
                                    value: cubit.policyTerms,
                                    onChanged: (value) {
                                      cubit.acceptPolicy(value!);
                                    },
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('I accept the policy and terms',
                                        style: TextStyle(
                                            fontSize: 22.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    (cubit.check != true)
                                        ? Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "Please accept the policy ",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 18.sp),
                                        ))
                                        : Text(""),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ConditionalBuilder(
                                condition: state is! RegisterLoadingState,
                                builder: (context) => Buttons_without_icon(
                                  function: () {
                                    if (formKey.currentState!.validate() &&
                                        (cubit.policyTerms)) {
                                      cubit.ChangeCheck();
                                      cubit.userRegister(
                                        email: emailAddress.text,
                                        name: name.text,
                                        phone: phone.text,
                                        password: password.text,
                                        dateOfBirth: birthDate.text,
                                        bloodType: bloodType.text,
                                        lastDonateTime: lastDonationDate.text,
                                        cityId: cityIdProfile!,
                                        govId: govIdProfile!,
                                        confirmPassword: confirmPassword.text,
                                        fcmToken: fcmToken!,
                                      );
                                      print("done");
                                    } else {
                                      cubit.ChangeCheck();
                                      print('not done');
                                    }
                                  },
                                  num_hieght: 80.h,
                                  text_button_name: 'Sign up',
                                  button_color: mainColor,
                                  num_border: 30,
                                  num_fontsize: 20,
                                  text_fontwwieght: FontWeight.normal,
                                ),
                                fallback: (context) => Center(child: CircularProgressIndicator(color: mainColor,),),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.008,
                            ),

                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
