import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../Login_Screen/Login_Screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  var firstName = TextEditingController();
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
    return Scaffold(
      body: BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.36,
                      color: Color.fromRGBO(237, 57, 74, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hello,',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
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
                              text: 'First Name',
                              controller: firstName,
                              keyboardtype: TextInputType.text,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your name',
                              text: 'Last Name',
                              controller: lastName,
                              keyboardtype: TextInputType.text,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your city',
                              text: 'City',
                              controller: city,
                              keyboardtype: TextInputType.text,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your email',
                              text: 'Email',
                              controller: emailAddress,
                              keyboardtype: TextInputType.emailAddress,
                            ),
                            SignupTextField(
                              hintText: 'Enter your password',
                              text: 'Password',
                              controller: password,
                              keyboardtype: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter password again',
                              text: 'Confirm Password',
                              controller: confirmPassword,
                              keyboardtype: TextInputType.visiblePassword,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your phone number',
                              text: 'Phone',
                              controller: phone,
                              keyboardtype: TextInputType.phone,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your location',
                              text: 'location',
                              controller: location,
                              keyboardtype: TextInputType.text,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your birthdate',
                              text: 'Birth Date',
                              controller: birthDate,
                              keyboardtype: TextInputType.datetime,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your Blood type',
                              text: 'Blood type',
                              controller: bloodType,
                              keyboardtype: TextInputType.text,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your Weight',
                              text: 'Weight',
                              controller: weight,
                              keyboardtype: TextInputType.number,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your Height',
                              text: 'Height',
                              controller: height,
                              keyboardtype: TextInputType.number,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Checkbox(
                                    activeColor: mainColor,
                                    value: cubit.policyTerms,
                                    onChanged: (value) {
                                      cubit.acceptPolicy(value!);
                                    },
                                  ),
                                ),
                                Text(
                                    'I accept the policy and terms',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Buttons_without_icon(
                              num_width:
                                  MediaQuery.of(context).size.width * 0.38,
                              num_hieght:
                                  MediaQuery.of(context).size.height * 0.06,
                              text_button_name: 'Sign up',
                              button_color: mainColor,
                              num_border: 30,
                              num_fontsize: 20,
                              text_fontwwieght: FontWeight.normal,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            );
          },
        ),
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
