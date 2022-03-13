import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../Login_Screen/Login_Screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();
  var dateofbirthpasswordController = TextEditingController();
  bool value = false;
  void initState(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 280,
                color: Color.fromRGBO(237, 57, 74, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
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
            SignupTextFieldcustom(text: 'Name',
                controller: nameController,
                keyboardtype: TextInputType.text,
                heightContainer: 85,
              widthContainer: 0.95,),
            SignupTextFieldcustom(text: 'Phone',
                controller: phoneController,
                keyboardtype: TextInputType.number,
                heightContainer: 85,
              widthContainer: 0.95,),
            SignupTextFieldcustom(text: 'Email Address',
              controller: emailController,
              keyboardtype: TextInputType.emailAddress,
              heightContainer: 85,
              widthContainer: 0.95,),
            SignupTextFieldcustom(text: 'Password',
              controller: passwordController,
              keyboardtype: TextInputType.visiblePassword,
              heightContainer: 85,
              widthContainer: 0.95,),
            SignupTextFieldcustom(text: 'Confirm Password',
              controller: confirmpasswordController,
              keyboardtype: TextInputType.visiblePassword,
              heightContainer: 85,
              widthContainer: 0.95,),
            SignupTextFieldForDatepicker(text: 'Date of birth',
              controller: dateofbirthpasswordController,
              keyboardtype: TextInputType.text,
              heightContainer: 90,
              widthContainer: 0.95,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Checkbox(
                    activeColor: mainColor,
                    value: this.value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                ),
                Text('I accept the policy and terms', style: TextStyle(color:mainColor,fontWeight: FontWeight.bold)),
              ],
            ),
            Buttons_without_icon(
                num_width: 0.45,
                num_hieght: 52,
                text_button_name: 'Sign Up',
                button_color: Color.fromRGBO(237, 57, 74, 1),
                num_border: 25,
                num_fontsize: 20,
                text_fontwwieght: FontWeight.normal),
                SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
