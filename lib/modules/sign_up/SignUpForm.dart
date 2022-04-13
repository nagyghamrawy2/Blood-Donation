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
                              hintText: 'Enter your first name',
                              text: 'First Name',
                              controller: firstName,
                              keyboardtype: TextInputType.text,
                              validatorText: 'Please enter your first name',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your last name',
                              text: 'Last Name',
                              controller: lastName,
                              keyboardtype: TextInputType.text,
                              validatorText: 'Please enter your last name',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your city',
                              text: 'City',
                              controller: city,
                              keyboardtype: TextInputType.text,
                              validatorText: 'Please enter your city',
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
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your phone number',
                              text: 'Phone',
                              controller: phone,
                              keyboardtype: TextInputType.phone,
                              validatorText: 'Please enter your phone number',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your location',
                              text: 'location',
                              controller: location,
                              keyboardtype: TextInputType.text,
                              validatorText: 'Please enter your location',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Birth Date",
                                      style: TextStyle(
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
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
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
                                            lastDate:
                                            DateTime.parse('2025-05-05'),
                                          ).then((value) {
                                            birthDate.text = DateFormat.yMMMd()
                                                .format(value!);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "Blood type",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            DropDownCustom(),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "City",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            LocationCityCustom(),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "Region",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            LocationRegionCustom(),
                            const SizedBox(
                              height: 10,
                            ),

                            SignupTextField(
                              hintText: 'Enter your Weight',
                              text: 'Weight',
                              controller: weight,
                              keyboardtype: TextInputType.number,
                              validatorText: 'Please enter your weight',
                            ),
                            const SizedBox(
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
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    activeColor: mainColor,
                                    value: cubit.policyTerms,
                                    onChanged: (value) {
                                      cubit.acceptPolicy(value!);
                                    },
                                  ),
                                ),
                                const Text('I accept the policy and terms',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(
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
