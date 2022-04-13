import 'package:blood_bank/modules/Login_Screen/login.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class SignUpScreen3 extends StatelessWidget {
  TextEditingController height = new TextEditingController();
  TextEditingController weight = new TextEditingController();

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
                      (cubit.x != null)
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: FileImage(cubit.x),
                              //Text
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/noImage.png"), //Text
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
                      const SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        child: Text("pick"),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Pick Image'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      cubit.GalleryImage();
                                      Navigator.pop(context);
                                    },
                                    child: Text('Gallery')),
                                ElevatedButton(
                                    onPressed: () {
                                      cubit.CameraImage();
                                      Navigator.pop(context);
                                    },
                                    child: Text('Camera')),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Go Back'))
                              ],
                            ),
                          );
                        },
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
