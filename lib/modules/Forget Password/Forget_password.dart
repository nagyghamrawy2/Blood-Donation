import 'package:flutter/material.dart';

import '../../shared/components/components.dart';


class ForgetPassword extends StatelessWidget {
  var emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 57, 74, 1),
        title: Text('Forget Password'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Color.fromRGBO(182, 182, 182, 1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Enter the email associated with your account and we`ll send an email with instructions to rest your password.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Textformfield_with_border(
              controller_Name: emailcontroller,
              keyboardtype: TextInputType.emailAddress,
              obsecure: false,
              text_hint: 'Enter your email',
              text_label: 'Email address',
              num_border: 10,
              // img_right_padding: 5,
              // img_bottom_padding: 3,
              // icon_name:'assets/images/profile.png',
              // img_width: 50,
              // img_height: 20
            ),
            SizedBox(
              height: 30,
            ),
            Buttons_without_icon(
                num_width: 0.9,
                num_hieght: 52,
                text_button_name: 'Send email',
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
