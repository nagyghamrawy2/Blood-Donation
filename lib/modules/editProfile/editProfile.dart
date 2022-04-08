import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({
    this.listOfApi,
});

  final List? listOfApi ;

  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var emailAddress = TextEditingController();
  var phone = TextEditingController();
  var location = TextEditingController();
  var birthDate = TextEditingController();
  var bloodType = TextEditingController();
  var height = TextEditingController();
  var weight = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    emailAddress = TextEditingController(text: listOfApi![0]);
    phone = TextEditingController(text: listOfApi![1]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 75,
              backgroundImage: const AssetImage('assets/images/pp.png'),
            ),
            const SizedBox(
              height: 5,
            ),
            Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SignupTextField(
                        hintText: 'Enter your name',
                        text: 'First Name',
                        controller: firstName,
                        keyboardtype: TextInputType.text,
                        validatorText: 'First Name must not be empty',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignupTextField(
                        hintText: 'Enter your name',
                        text: 'Last Name',
                        controller: lastName,
                        keyboardtype: TextInputType.text,
                        validatorText: 'Last Name must not be empty',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignupTextField(
                        hintText: 'Enter your email',
                        text: 'Email',
                        controller: emailAddress,
                        keyboardtype: TextInputType.emailAddress,
                        validatorText: 'Email must not be empty',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignupTextField(
                        hintText: 'Enter your phone number',
                        text: 'Phone',
                        controller: phone,
                        keyboardtype: TextInputType.phone,
                        validatorText: 'Phone must not be empty',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignupTextField(
                        hintText: 'Enter your location',
                        text: 'location',
                        controller: location,
                        keyboardtype: TextInputType.text,
                        validatorText: 'Location must not be empty',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                      width: double.infinity,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Birth Date',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: TextFormField(
                              readOnly: true,
                              controller: birthDate,
                              keyboardType: TextInputType.datetime,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Birthdate must not be empty';
                                }
                              },
                              onTap: (){
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.parse('2025-05-05'),
                                ).then((value){
                                  birthDate.text =
                                      DateFormat.yMMMd().format(value!);
                                });
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: greyColor,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.red, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'Enter your birthdate',
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      SignupTextField(
                        hintText: 'Enter your Blood type',
                        text: 'Blood type',
                        controller: bloodType,
                        keyboardtype: TextInputType.text,
                        validatorText: 'BloodType must not be empty',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignupTextField(
                        hintText: 'Enter your Weight',
                        text: 'Weight',
                        controller: weight,
                        keyboardtype: TextInputType.number,
                        validatorText: 'Weight must not be empty',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SignupTextField(
                        hintText: 'Enter your Height',
                        text: 'Height',
                        controller: height,
                        keyboardtype: TextInputType.number,
                        validatorText: 'Height must not be empty',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Buttons_without_icon(
                        function: () {
                          if(formKey.currentState!.validate()){
                            print('done');
                          }else{
                            print('not done');
                          }
                        },
                        num_hieght: 52,
                        text_button_name: 'Save data',
                        button_color: mainColor,
                        num_border: 12,
                        num_fontsize: 20,
                        text_fontwwieght: FontWeight.normal,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
