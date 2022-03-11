import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  var passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 57, 74, 1),
        title: Text('Create new password'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
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
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Color.fromRGBO(237, 57, 74, 1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '* MAKE YOUR PASSWORD LONG.',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '* MAKE YOUR PASSWORD A NONSENSE PHRASE .',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '* INCLUDE NUMBERS,SYMBOLS .',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '* AVOID USING OBVIOUS PERSONAL INFORMATION .',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
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
            SizedBox(
              height: 90,
            ),
            Textformfield_with_border(
              controller_Name: passwordcontroller,
              keyboardtype: TextInputType.visiblePassword,
              obsecure: true,
              text_hint: 'Enter New password',
              text_label: 'New Password',
              num_border: 10,
            ),
            SizedBox(
              height: 40,
            ),
            Textformfield_with_border(
              controller_Name: passwordcontroller,
              keyboardtype: TextInputType.visiblePassword,
              obsecure: true,
              text_hint: 'Confirm new  password',
              text_label: 'Confirm Password',
              num_border: 10,
            ),
            SizedBox(
              height: 30,
            ),
            Buttons_without_icon(
                num_width: 0.9,
                num_hieght: 52,
                text_button_name: 'Change Password',
                button_color: Color.fromRGBO(237, 57, 74, 1),
                num_border: 11,
                num_fontsize: 20,
                text_fontwwieght: FontWeight.normal)
          ],
        ),
      ),
    );
  }
}
