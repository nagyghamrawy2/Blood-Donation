import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

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
      appBar: AppBar(
        title: Text('Edit profile'),
        backgroundColor: mainColor,
      ),
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
                      text: 'First Name',
                      controller: firstName,
                      keyboardtype: TextInputType.text,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your name',
                      text: 'Last Name',
                      controller: lastName,
                      keyboardtype: TextInputType.text,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your email',
                      text: 'Email',
                      controller: emailAddress,
                      keyboardtype: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your phone number',
                      text: 'Phone',
                      controller: phone,
                      keyboardtype: TextInputType.phone,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your location',
                      text: 'location',
                      controller: location,
                      keyboardtype: TextInputType.text,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your birthdate',
                      text: 'Birth Date',
                      controller: birthDate,
                      keyboardtype: TextInputType.datetime,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your Blood type',
                      text: 'Blood type',
                      controller: bloodType,
                      keyboardtype: TextInputType.text,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your Weight',
                      text: 'Weight',
                      controller: weight,
                      keyboardtype: TextInputType.number,
                    ),
                    SizedBox(height: 10,),
                    SignupTextField(
                      hintText: 'Enter your Height',
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
