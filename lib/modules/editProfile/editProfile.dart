import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);

  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var emailAddress = TextEditingController();
  var phone = TextEditingController();
  var location = TextEditingController();
  var birthDate = TextEditingController();
  var bloodType = TextEditingController();
  var height = TextEditingController();
  var weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('assets/images/pp.png'),
            ),
            SizedBox(height: 5,),
            Form(
              key: key,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SignupTextField(
                      hintText: 'Enter your name',
                      width: double.infinity,
                      text: 'First Name',
                      controller: firstName,
                      keyboardtype: TextInputType.text,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your name',
                      width: double.infinity,
                      text: 'Last Name',
                      controller: lastName,
                      keyboardtype: TextInputType.text,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your email',
                      width: double.infinity,
                      text: 'Email',
                      controller: emailAddress,
                      keyboardtype: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your phone number',
                      width: double.infinity,
                      text: 'Phone',
                      controller: phone,
                      keyboardtype: TextInputType.phone,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your location',
                      width: double.infinity,
                      text: 'location',
                      controller: location,
                      keyboardtype: TextInputType.text,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your birthdate',
                      width: double.infinity,
                      text: 'Birth Date',
                      controller: birthDate,
                      keyboardtype: TextInputType.datetime,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your Blood type',
                      width: double.infinity,
                      text: 'Blood type',
                      controller: bloodType,
                      keyboardtype: TextInputType.text,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your Weight',
                      width: double.infinity,
                      text: 'Weight',
                      controller: weight,
                      keyboardtype: TextInputType.number,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your Height',
                      width: double.infinity,
                      text: 'Height',
                      controller: height,
                      keyboardtype: TextInputType.number,
                    ),
                    SizedBox(height: 20,),
                    Buttons_without_icon(
                        num_width: 0.9,
                        num_hieght: 52,
                        text_button_name: 'Save data',
                        button_color: mainColor,
                        num_border: 12,
                        num_fontsize: 20,
                        text_fontwwieght: FontWeight.normal,
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
