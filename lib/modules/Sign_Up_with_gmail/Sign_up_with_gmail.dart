import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sign_Up_With_Gmail extends StatefulWidget {
  const Sign_Up_With_Gmail({Key? key}) : super(key: key);

  @override
  State<Sign_Up_With_Gmail> createState() => _Sign_Up_With_GmailState();
}

class _Sign_Up_With_GmailState extends State<Sign_Up_With_Gmail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
                body: Column(
                  children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset('assets/images/todo.jpg' ,fit: BoxFit.fill,)

                          ),
                    SizedBox(height: 78,),
                    Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "it's easier to sign up now",
                      style: TextStyle(fontSize: 20 ,color: Colors.black26),
                    ),
                    SizedBox(height: 34,),
                    Buttons_without_icon(num_width: 0.7, num_hieght: 66, text_button_name: "Sign up with email", button_color: Colors.grey, num_border: 30, num_fontsize: 20, text_fontwwieght: FontWeight.normal),
                    SizedBox(height: 25,),
                    Button_with_icon(num_width: 0.8, num_height: 66, img_left_padding: 5, img_bottom_padding: 5, label_name: "Continue with Google", color: Color(0xFF086BFF), icon_name: "assets/images/chat.png", img_width: 100, img_height: 100, fontsize: 20,label_color: Colors.white ,label_fontwieght: FontWeight.normal, num_border: 30,),
                    SizedBox(height: 118,),
                    Text(
                      "Already have account? Login",
                      style: TextStyle(fontSize: 22 , color: Color(0xFF8B8888)),
                    ),
                  ],
                ),
      ),
    );
  }
}
