import 'package:blood_bank/modules/Login_Screen/login.dart';
import 'package:blood_bank/modules/sign_up/cubit/register_cubit.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SignUpScreen3 extends StatefulWidget {
  late String phone;

  late String birthDate;

  late String name;
  late String emailAddress;
  late String password;
  late String confirmPassword;

  SignUpScreen3(
      {required this.phone,
      required this.birthDate,
      required this.name,
      required this.emailAddress,
      required this.password,
      required this.confirmPassword});

  @override
  State<SignUpScreen3> createState() => _SignUpScreen3State();
}

class _SignUpScreen3State extends State<SignUpScreen3> {
  TextEditingController lastDonationDate = new TextEditingController();

  var bloodType = TextEditingController();
  String?  fcmToken;
  var formKey = GlobalKey<FormState>();
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getToken().then((value){
      print(value);
      setState(() {
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
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
            } else{
              ShowToast(state: ToastStates.ERROR , text: "Please make sure the data enter is correct" );
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
                    color: const Color.fromRGBO(237, 57, 74, 1),
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
                        horizontal: MediaQuery.of(context).size.width * 0.08),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "step 3 of 3",
                            style: TextStyle(
                                fontSize: 22.h,
                                fontStyle: FontStyle.italic,
                                color: mainColor),
                          ),
                        ),
                        Container(
                          width: 300.w,
                          height: 7.h,
                          color: mainColor,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
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
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
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
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.parse('2025-05-05'),
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
                        Buttons_without_icon(
                          function: () {
                            if (formKey.currentState!.validate() &&
                                (cubit.policyTerms)) {
                              cubit.ChangeCheck();
                              cubit.userRegister(
                                email: widget.emailAddress,
                                name: widget.name,
                                phone: widget.phone,
                                password: widget.password,
                                dateOfBirth: widget.birthDate,
                                bloodType: bloodType.text,
                                lastDonateTime: lastDonationDate.text,
                                cityId: cityIdConstant!,
                                govId: govIdConstant!,
                                confirmPassword: widget.confirmPassword,
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.008,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
