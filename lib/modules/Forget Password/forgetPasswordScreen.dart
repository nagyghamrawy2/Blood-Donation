import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var formkey=GlobalKey<FormState>();

  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 110.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: greyColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter the email associated with your account and we`ll send an email with instructions to reset your password.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Textformfield_with_border(
                  controllerName: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  obsecure: false,
                  hintText: 'Enter your email',
                  text_label: 'Email address',
                  num_border: 10,
                  validatorText: 'Email address must not be empty',
                  haveIcon: false,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Buttons_without_icon(
                    function: () {
                      if(formkey.currentState!.validate()){
                        print('done');
                      }else{
                        print('not done');
                      }
                    },
                    num_hieght: 52,
                    text_button_name: 'Send email',
                    button_color: mainColor,
                    num_border: 11,
                    num_fontsize: 20,
                    text_fontwwieght: FontWeight.normal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
