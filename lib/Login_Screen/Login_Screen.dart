import 'package:flutter/material.dart';
import '../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: Color.fromRGBO(237, 57, 74, 1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(130),
                    bottomLeft: Radius.circular(130),
                  ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome back,',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text('Login in !',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                ],
              ),
            ),
            SizedBox(height: 80,),
            Textformfield_with_border_with_icon2(
                controller_Name: emailcontroller,
                keyboardtype: TextInputType.emailAddress,
                obsecure: false,
                text_hint: 'Enter your email address',
                text_label: 'Email adderss',
                num_border: 10,
                img_right_padding: 5,
                img_bottom_padding: 3,
                icon_name: 'assets/images/emaillogin.png',
                img_width: 50,
                img_height: 20),
            SizedBox(height: 50,),
            Textformfield_with_border_with_icon2(
                controller_Name: passwordcontroller,
                keyboardtype: TextInputType.visiblePassword,
                obsecure: true,
                text_hint: 'Enter your Password',
                text_label: 'Password',
                num_border: 10,
                img_right_padding: 5,
                img_bottom_padding: 3,
                icon_name: 'assets/images/lock.png',
                img_width: 50,
                img_height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text('Remember me',style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Align(
                          alignment: Alignment.centerRight,
                            child: Text('Forget password ?',style: TextStyle(color: Colors.grey),)),
                      ),
                    ),
                  ],
                )
                // MaterialButton(
                //   onPressed: () {},
                //   child: Padding(
                //     padding: const EdgeInsets.only(right: 5),
                //     child: Align(
                //       alignment: Alignment.centerRight,
                //         child: Text('Forget password ?')),
                //   ),
                // ),
            ,SizedBox(height: 60,),
            Buttons_without_icon(
                num_width: 0.45,
                num_hieght: 52,
                text_button_name: 'Login',
                button_color: Color.fromRGBO(237, 57, 74, 1),
                num_border: 25,
                num_fontsize: 20,
                text_fontwwieght: FontWeight.normal)
          ],
        ),
      ),
    );
  }
}
