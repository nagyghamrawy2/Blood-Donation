import 'package:blood_bank/modules/Login_Screen/login.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUpScreen2 extends StatelessWidget {
  TextEditingController phone = new TextEditingController();
  TextEditingController birthDate = new TextEditingController();

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
                      color: const Color.fromRGBO(237, 57, 74, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Continue,',
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
                            hintText: 'Enter your phone number',
                            text: 'Phone Number',
                            controller: phone,
                            keyboardtype: TextInputType.phone,
                            validatorText: 'Please enter your phone number',
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
                              "Governorate",
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
                          LocationRegionCustom(),
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
                    ),
                  ),
                ],
              ),
            )
          // Center(
          //   child: Column(
          //     children: [
          //       (cubit.x != null) ? CircleAvatar(
          //         radius: 100,
          //         backgroundImage: FileImage(cubit.x),
          //         //Text
          //       ) :
          //       CircleAvatar(
          //         radius: 100,
          //         backgroundImage: AssetImage(
          //             "assets/images/noImage.png"
          //         ), //Text
          //       ),
          //       RaisedButton(
          //         child: Text("pick"),
          //         onPressed: () {
          //           showDialog(
          //             context: context,
          //             builder: (context) =>
          //                 AlertDialog(
          //                   title: Text('Pick Image'),
          //                   actions: [
          //                     ElevatedButton(
          //                         onPressed: () {
          //                           cubit.GalleryImage();
          //                           Navigator.pop(context);
          //                         },
          //                         child: Text('Gallery')),
          //                     ElevatedButton(
          //                         onPressed: () {
          //                           cubit.CameraImage();
          //                           Navigator.pop(context);
          //                         },
          //                         child: Text('Camera')),
          //                     ElevatedButton(
          //                         onPressed: () {
          //                           Navigator.pop(context);
          //                         },
          //                         child: Text('Go Back'))
          //                   ],
          //                 ),
          //           );
          //         },
          //       ),
          //     ],
          //   ),
          // )
        );
      },
    );
  }
}
