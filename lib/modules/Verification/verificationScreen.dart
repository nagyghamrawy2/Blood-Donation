import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/styles/colors.dart';

class VerificationScreen extends StatelessWidget {
  late String validatorText='    *Error*';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, index) {},
            builder: (context, index) {
              AppCubit cubit = AppCubit.get(context);
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Verification'),
                    actions: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications))
                    ],
                  ),
                  body: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          Transform.rotate(
                            angle: -math.pi / 7,
                            child: Container(
                              height: 120.0,
                              width: 120.0,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/verify.png'),
                                  fit: BoxFit.fill,
                                ),
//  shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                'OTP VERIFICATION',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 26.sp,
                                ),
                              )),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Enter verification code sent to your Email Address',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: greyColor2,
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(color: Colors.grey)),
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  textAlign: TextAlign.center,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return validatorText;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(color: Colors.grey)),
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  textAlign: TextAlign.center,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return validatorText;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(color: Colors.grey)),
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  textAlign: TextAlign.center,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return validatorText;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(color: Colors.grey)),
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  textAlign: TextAlign.center,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return validatorText;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Buttons_without_icon(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    print('done');
                                  } else {
                                    print('not done');
                                  }
                                },
                                num_hieght: 52,
                                text_button_name: 'Verifiy',
                                button_color:
                                    const Color.fromRGBO(237, 57, 74, 1),
                                num_border: 11,
                                num_fontsize: 20,
                                text_fontwwieght: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                  ));
            }));
  }
}
