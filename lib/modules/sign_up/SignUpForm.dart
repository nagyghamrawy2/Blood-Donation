import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
  var phone = TextEditingController();
  var location = TextEditingController();
  var birthDate = TextEditingController();
  var bloodType = TextEditingController();
  var height = TextEditingController();
  var weight = TextEditingController();
  var city = TextEditingController();
  bool value = false;


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
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
                      height: MediaQuery.of(context).size.height * 0.36,
                      color: const Color.fromRGBO(237, 57, 74, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Hello,',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Text(
                            'Sign Up ',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    clipper: CustomClipPath(),
                  ),
                  Form(
                      key: key,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            SignupTextField(
                              hintText: 'Enter your name',
                              text: 'Name',
                              controller: name,
                              keyboardtype: TextInputType.text,
                              validatorText: 'Please enter your first name',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your email',
                              text: 'Email',
                              controller: emailAddress,
                              keyboardtype: TextInputType.emailAddress,
                              validatorText: 'Please enter your email',
                            ),
                            const SizedBox(
                              height: 10,
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
                            const SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter password again',
                              text: 'Confirm Password',
                              controller: confirmPassword,
                              keyboardtype: TextInputType.visiblePassword,
                              validatorText: 'Please enter your password again',
                              isPasswordField: true,
                              secure: cubit.obsecure,
                              suffixFunction: () {
                                cubit.changePasswordStatus();
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Buttons_without_icon(
                              num_hieght:
                              MediaQuery.of(context).size.height * 0.06,
                              text_button_name: 'Continue',
                              button_color: mainColor,
                              num_border: 30,
                              num_fontsize: 20,
                              text_fontwwieght: FontWeight.normal,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
        },
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
