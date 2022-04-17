import 'package:blood_bank/modules/sign_up/SignUpForm2.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../Login_Screen/login.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  var name = TextEditingController();
  var lastName = TextEditingController();
  var emailAddress = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  bool value = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
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
                      //MediaQuery.of(context).size.height * 0.36,
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
                            horizontal:
                                MediaQuery.of(context).size.width * 0.08),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.bottomLeft,
                              child: Text(
                                  "step 1 of 3",
                                style: TextStyle(fontSize: 22.h , fontStyle: FontStyle.italic , color: mainColor),
                              ),
                            ),
                            Container(
                              width: 300.w,
                              height: 7.h,
                              color: Colors.red[200],
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 100.w,
                                height: 7.h,
                                color: mainColor,
                              ),
                            ),
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
                              validatorText: 'Please enter your first name',
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
                              validatorText: 'Please enter your email',
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.008,
                            ),
                            SignupTextField(
                              hintText: 'Enter your password',
                              text: 'Password',
                              controller: password,
                              keyboardtype: TextInputType.emailAddress,
                              validatorText: 'Please enter your password',
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
                              validatorText: 'Please enter your password again',
                              isPasswordField: true,
                              secure: cubit.confirmObsecure,
                              suffixFunction: () {
                                cubit.changeConfirmPasswordStatus();

                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.w),
                              child: Buttons_without_icon(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    print('done');
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen2()));
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

//  bool value = false;
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 5.0),
// child: Checkbox(
// activeColor: mainColor,
// value: this.value,
// onChanged: (value) {
// setState(() {
// this.value = value!;
// });
// },
// ),
// ),
// Text('I accept the policy and terms',
// style: TextStyle(
// color: mainColor, fontWeight: FontWeight.bold)),
// ],
// ),
