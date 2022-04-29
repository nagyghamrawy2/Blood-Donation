import 'package:blood_bank/modules/Login_Screen/login.dart';
import 'package:blood_bank/modules/sign_up/SignUpForm3.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen2 extends StatelessWidget {
  TextEditingController phone = new TextEditingController();
  TextEditingController birthDate = new TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
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
                        'Continue,',
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
                autovalidateMode: AutovalidateMode.always,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "step 2 of 3",
                          style: TextStyle(fontSize: 22.h , fontStyle: FontStyle.italic , color: mainColor),
                        ),
                      ),
                      Container(
                        width: 300.w,
                        height: 7.h,
                        color: Colors.red[200],
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 150.w,
                          height: 7.h,
                          color: mainColor,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.008,
                      ),
                      SignupTextField(
                        hintText: 'Enter your phone number',
                        text: 'Phone Number',
                        controller: phone,
                        keyboardtype: TextInputType.phone,
                        validatorText: 'Please enter your phone number',
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
                            height:
                                MediaQuery.of(context).size.height * 0.008,
                          ),
                          TextFormField(
                            readOnly: true,
                            keyboardType: TextInputType.datetime,
                            controller: birthDate,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Date must not be empty';
                              } else {
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
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.parse('2025-05-05'),
                              ).then((value) {
                                birthDate.text =
                                    DateFormat.yMMMd().format(value!);
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
                      // DropdownButtonFormField(
                      //   hint: const Text(
                      //     'Governorate',
                      //   ),
                      //   validator: (value) {
                      //     if (value == null) {
                      //       return "Please choose your governorate";
                      //     }
                      //   },
                      //   decoration: InputDecoration(
                      //     focusColor: Colors.green,
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: const BorderSide(
                      //         color: greyColor,
                      //       ),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: const BorderSide(
                      //         width: 1,
                      //       ),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     errorBorder: OutlineInputBorder(
                      //       borderSide: const BorderSide(color: Colors.red, width: 1),
                      //       borderRadius: BorderRadius.circular(20),
                      //     ),
                      //     focusedErrorBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      //   // Initial Value
                      //
                      //   // Down Arrow Icon
                      //   icon: const Icon(Icons.keyboard_arrow_down),
                      //   items: cubit.governorateItemList.map((String items) {
                      //     return DropdownMenuItem(
                      //       value: items,
                      //       child: Text(items),
                      //     );
                      //   }).toList(),
                      //   // After selecting the desired option,it will
                      //   // change button value to selected value
                      //   onChanged: (newValue) {
                      //     print(newValue);
                      //     //cubit.ChangeLocationCityValue(newValue);
                      //   },
                      // ),
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      //LocationCityCustom(border: true,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: Buttons_without_icon(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              print('done');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen3()));
                            } else {
                              print('not done');
                            }

                          },
                          num_hieght: 90.h,
                          text_button_name: 'Next Step >',
                          button_color: mainColor,
                          num_border: 30,
                          num_fontsize: 20,
                          text_fontwwieght: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
