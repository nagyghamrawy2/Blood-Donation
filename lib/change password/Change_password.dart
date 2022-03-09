import 'package:flutter/material.dart';

import '../shared/components/components.dart';
class ChangePasswordScreen extends StatelessWidget {
  var emailcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[500],
        title: Text('Change Password'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30.0,),
          Center(
            child: Container(
              width:MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height *0.18,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(topRight:Radius.circular(25.0),bottomLeft:Radius.circular(25.0), )
              ),

              child: Column(
                children: [
                  SizedBox(height: 5.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                    child: Align(
                      alignment:  Alignment.topLeft,
                      child: Text('* MAKE YOUR PASSWORD LONG.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13
                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                    child: Align(
                      alignment:  Alignment.topLeft,
                      child: Text('* MAKE YOUR PASSWORD A NONSENSE PHRASE .',style: TextStyle(
                        color: Colors.white,
                          fontSize: 13
                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                    child: Align(
                      alignment:  Alignment.topLeft,
                      child: Text('* INCLUDE NUMBERS,SYMBOLS .',style: TextStyle(
                        color: Colors.white,
                          fontSize: 13
                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                    child: Align(
                      alignment:  Alignment.topLeft,
                      child: Text('* AVOID USING OBVIOUS PERSONAL INFORMATION .',style: TextStyle(
                        color: Colors.white,
                          fontSize: 12
                      ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                    child: Align(
                      alignment:  Alignment.topLeft,
                      child: Text('* DO NOT REUSE PASSWORDS.',style: TextStyle(
                        color: Colors.white,
                          fontSize: 12
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50,),
          Textformfield_with_border_with_icon(
              controller_Name: emailcontroller,
              num_width: 0.9,
              num_hieght: 70,
              keyboardtype: TextInputType.emailAddress,
              obsecure: true,
              text_hint: 'Enter old  password',
              text_label: 'Old Password',
              num_border: 10,
              img_right_padding: 5,
              img_bottom_padding: 3,
              icon_name:'assets/images/profile.png',
              img_width: 50,
              img_height: 20),
          SizedBox(height: 30,),
          Textformfield_with_border_with_icon(
              controller_Name: emailcontroller,
              num_width: 0.9,
              num_hieght: 70,
              keyboardtype: TextInputType.emailAddress,
              obsecure: true,
              text_hint: 'Enter New password',
              text_label: 'New Password',
              num_border: 10,
              img_right_padding: 5,
              img_bottom_padding: 3,
              icon_name:'assets/images/profile.png',
              img_width: 50,
              img_height: 20),
          SizedBox(height: 30,),
          Textformfield_with_border_with_icon(
              controller_Name: emailcontroller,
              num_width: 0.9,
              num_hieght: 70,
              keyboardtype: TextInputType.emailAddress,
              obsecure: true,
              text_hint: 'Confirm password',
              text_label: 'Confirm New Password',
              num_border: 10,
              img_right_padding: 5,
              img_bottom_padding: 3,
              icon_name:'assets/images/profile.png',
              img_width: 50,
              img_height: 20),
        ],
      ),

    );
  }
}
