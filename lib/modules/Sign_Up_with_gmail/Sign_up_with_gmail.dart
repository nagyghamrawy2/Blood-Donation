import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Sign_Up_With_Gmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Image.asset('assets/images/doanateBlood.png',
                  height: MediaQuery.of(context).size.height * 0.47,
                  width: double.infinity
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 50.sp),
              ),
              Text(
                "it's easier to sign up now",
                style: TextStyle(fontSize: 25.sp, color: Colors.black26),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
                child: Buttons_without_icon(
                    num_hieght: MediaQuery.of(context).size.height * 0.068,
                    text_button_name: "Sign up with email",
                    button_color: Colors.grey,
                    num_border: 30.r,
                    num_fontsize: 25.sp,
                    text_fontwwieght: FontWeight.normal),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Button_with_icon(
                num_width: MediaQuery.of(context).size.width * 0.8,
                num_height: MediaQuery.of(context).size.height * 0.068,
                img_left_padding: 0.1.w,
                img_bottom_padding: 4.h,
                label_name: "Continue With Google",
                color: Color(0xFF086BFF),
                icon_name: "assets/images/googleLogo.png",
                img_width: 60.w,
                img_height: 100.h,
                fontsize: 25.sp,
                label_color: Colors.white,
                label_fontwieght: FontWeight.normal,
                num_border: 30.r,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Wrap(
                children: [
                  Text(
                    "Already have account? ",
                    style: TextStyle(fontSize: 25.sp, color: Color(0xFF8B8888)),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 25.sp, color: Colors.deepPurple),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
