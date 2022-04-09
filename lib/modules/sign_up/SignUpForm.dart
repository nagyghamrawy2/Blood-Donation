import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../Login_Screen/Login_Screen.dart';

class SignUpScreen extends StatelessWidget {
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

  var formKey = GlobalKey<FormState>();

  bool value = false;

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
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          SignupTextField(
                            hintText: 'Enter your first name',
                            text: 'First Name',
                            controller: firstName,
                            keyboardtype: TextInputType.text,
                            validatorText: 'Please enter your first name',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SignupTextField(
                            hintText: 'Enter your last name',
                            text: 'Last Name',
                            controller: lastName,
                            keyboardtype: TextInputType.text,
                            validatorText: 'Please enter your last name',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SignupTextField(
                            hintText: 'Enter your city',
                            text: 'City',
                            controller: city,
                            keyboardtype: TextInputType.text,
                            validatorText: 'Please enter your city',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SignupTextField(
                            hintText: 'Enter your email',
                            text: 'Email',
                            controller: emailAddress,
                            keyboardtype: TextInputType.emailAddress,
                            validatorText: 'Please enter your email',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PasswordTextField(
                            hintText: 'Enter your password',
                            text: 'Password',
                            controller: password,
                            keyboardtype: TextInputType.emailAddress,
                            validatorText: 'Please enter your password',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PasswordTextField(
                            hintText: 'Enter password again',
                            text: 'Confirm Password',
                            controller: confirmPassword,
                            keyboardtype: TextInputType.visiblePassword,
                            validatorText: 'Please enter your password again',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SignupTextField(
                            hintText: 'Enter your phone number',
                            text: 'Phone',
                            controller: phone,
                            keyboardtype: TextInputType.phone,
                            validatorText: 'Please enter your phone number',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SignupTextField(
                            hintText: 'Enter your location',
                            text: 'location',
                            controller: location,
                            keyboardtype: TextInputType.text,
                            validatorText: 'Please enter your location',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: double.infinity,
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Birth Date",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: TextFormField(
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: greyColor,
                                            )),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        hintText: "Date",
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        suffixIcon: Icon(
                                          Icons.calendar_today,
                                        ),
                                      ),
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate:
                                              DateTime.parse('2025-05-05'),
                                        ).then((value) {
                                          birthDate.text =
                                              DateFormat.yMMMd().format(value!);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          SignupTextField(
                            hintText: 'Enter your Weight',
                            text: 'Weight',
                            controller: weight,
                            keyboardtype: TextInputType.number,
                            validatorText: 'Please enter your weight',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DropDownCustom(),
                          SizedBox(
                            height: 10,
                          ),
                          SignupTextField(
                            hintText: 'Enter your Height',
                            text: 'Height',
                            controller: height,
                            keyboardtype: TextInputType.number,
                            validatorText: 'Please enter your height',
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
                              Text('I accept the policy and terms',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Buttons_without_icon(
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
