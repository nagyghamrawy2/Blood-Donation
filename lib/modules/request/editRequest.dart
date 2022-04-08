import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class EditRequestScreen extends StatelessWidget {
  EditRequestScreen({Key? key}) : super(key: key);

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var bloodTypeController = TextEditingController();
  var bloodBagsController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  List<String> bloodType = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit request'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SignupTextField(
                      hintText: 'Enter Title',
                      text: 'Title',
                      controller: titleController,
                      keyboardtype: TextInputType.text,
                      validatorText: 'Title must not be empty',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SignupTextField(
                      hintText: 'Enter Description',
                      text: 'Description',
                      controller: descriptionController,
                      keyboardtype: TextInputType.text,
                      validatorText: 'Description must not be empty',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField(
                      items: bloodType
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (val){
                        print(val);
                      },
                    ),
                    SignupTextField(
                      hintText: 'Enter bloodType',
                      text: 'BloodType',
                      controller: bloodTypeController,
                      keyboardtype: TextInputType.emailAddress,
                      validatorText: 'BloodType must not be empty',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SignupTextField(
                      hintText: 'Enter BloodBags',
                      text: 'BloodBags',
                      controller: bloodBagsController,
                      keyboardtype: TextInputType.number,
                      validatorText: 'BloodBags must not be empty',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SignupTextField(
                      hintText: 'Enter Phone',
                      text: 'Phone',
                      controller: phoneController,
                      keyboardtype: TextInputType.text,
                      validatorText: 'Phone must not be empty',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SignupTextField(
                      hintText: 'Enter location',
                      text: 'location',
                      controller: locationController,
                      keyboardtype: TextInputType.datetime,
                      validatorText: 'location must not be empty',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SignupTextField(
                      hintText: 'Enter your Blood type',
                      text: 'Date',
                      controller: dateController,
                      keyboardtype: TextInputType.text,
                      validatorText: 'date must not be empty',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Buttons_without_icon(
                    //   num_hieght: 52,
                    //   text_button_name: 'Save data',
                    //   button_color: mainColor,
                    //   num_border: 12,
                    //   num_fontsize: 20,
                    //   text_fontwwieght: FontWeight.normal,
                    // ),
                    Container(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        child: Text('Save data'),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print('done');
                          } else {
                            print('not done');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: mainColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
