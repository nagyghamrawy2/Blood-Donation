import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  var passwordController = TextEditingController();

  CreateNewPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new password'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: mainColor,
                    borderRadius: const BorderRadius.only(
                      topRight: const Radius.circular(25.0),
                      bottomLeft: const Radius.circular(25.0),
                    )),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '* MAKE YOUR PASSWORD LONG.',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '* MAKE YOUR PASSWORD A NONSENSE PHRASE .',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '* INCLUDE NUMBERS,SYMBOLS .',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '* AVOID USING OBVIOUS PERSONAL INFORMATION .',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '* DO NOT REUSE PASSWORDS.',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Textformfield_with_border(
              controller_Name: passwordController,
              keyboardtype: TextInputType.visiblePassword,
              obsecure: true,
              text_hint: 'Enter New password',
              text_label: 'New Password',
              num_border: 10,
            ),
            const SizedBox(
              height: 40,
            ),
            Textformfield_with_border(
              controller_Name: passwordController,
              keyboardtype: TextInputType.visiblePassword,
              obsecure: true,
              text_hint: 'Confirm new  password',
              text_label: 'Confirm Password',
              num_border: 10,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Buttons_without_icon(
                  num_hieght: 52,
                  text_button_name: 'Change Password',
                  button_color: mainColor,
                  num_border: 11,
                  num_fontsize: 20,
                  text_fontwwieght: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
