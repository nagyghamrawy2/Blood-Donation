import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class EditRequest extends StatelessWidget {
  EditRequest({Key? key}) : super(key: key);

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var bloodTypeController = TextEditingController();
  var bloodBagsController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  var dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit request'),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Form(
            key: key,
            child: Column(
              children: [
                SignupTextField(
                  text: 'Title',
                  controller: titleController,
                  keyboardtype: TextInputType.text,
                ),
                SizedBox(height: 10,),
                SignupTextField(
                  text: 'Description',
                  controller: descriptionController,
                  keyboardtype: TextInputType.text,
                ),
                SizedBox(height: 10,),
                SignupTextField(
                  text: 'Blood Type',
                  controller: bloodTypeController,
                  keyboardtype: TextInputType.text,
                ),
                SizedBox(height: 10,),
                SignupTextField(
                  text: 'Blood Bags',
                  controller: bloodBagsController,
                  keyboardtype: TextInputType.number,
                ),
                SizedBox(height: 10,),
                SignupTextField(
                  text: 'Phone',
                  controller: phoneController,
                  keyboardtype: TextInputType.phone,
                ),
                SizedBox(height: 10,),
                SignupTextField(
                  text: 'Location',
                  controller: locationController,
                  keyboardtype: TextInputType.text,
                ),
                SizedBox(height: 10,),
                SignupTextField(
                  text: 'Date',
                  controller: dateController,
                  keyboardtype: TextInputType.text,
                ),
                SizedBox(height: 15,),
                Buttons_without_icon(
                  num_width: 0.9,
                  num_hieght: 52,
                  text_button_name: 'Save data',
                  button_color: mainColor,
                  num_border: 12,
                  num_fontsize: 20,
                  text_fontwwieght: FontWeight.normal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
