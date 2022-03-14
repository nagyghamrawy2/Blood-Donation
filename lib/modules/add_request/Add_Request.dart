import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';

class Add_Request extends StatefulWidget {
  @override
  State<Add_Request> createState() => _Add_RequestState();
}

class _Add_RequestState extends State<Add_Request> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController bagsController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController expired_dateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFED394A),
        title: Text(
          "Request for blood",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: ListView(
          children: [
            Requst_textformfield(
                controller_Name: titleController,
                text_name: "Title",
                num_width: 0.9,
                num_height: 69,
                keyboardtype: TextInputType.name,
                obsecure: false,
                text_hint: "Enter your title "),
            SizedBox(
              height: 5,
            ),
            Requst_textformfield(
                controller_Name: descriptionController,
                text_name: "Description",
                num_width: 0.9,
                num_height: 99,
                keyboardtype: TextInputType.name,
                obsecure: false,
                text_hint: "Enter your description "),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Choose blood group",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  height: 103,
                  width: MediaQuery.of(context).size.width * 0.93,
                  child: Material(
                    elevation: 10.0,
                    shadowColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Textformfield_with_icon(
                controller_Name: bagsController,
                text_name: "Blood Bags",
                num_width: 0.9,
                num_height: 50,
                keyboardtype: TextInputType.number,
                obsecure: false,
                text_hint: "Enter number of bags",
                img_right_padding: 15,
                img_bottom_padding: 5,
                icon_name: "assets/images/blood-bag.png",
                img_width: 10,
                img_height: 10),
            SizedBox(height: 12,),
            Textformfield_with_icon(
                controller_Name: bagsController,
                text_name: "Phone Number",
                num_width: 0.9,
                num_height: 50,
                keyboardtype: TextInputType.number,
                obsecure: false,
                text_hint: "Enter your phone",
                img_right_padding: 15,
                img_bottom_padding: 5,
                icon_name: "assets/images/blood-bag.png",
                img_width: 10,
                img_height: 10),
            SizedBox(height: 12,),
            Textformfield_with_icon(
                controller_Name: bagsController,
                text_name: "Location",
                num_width: 0.9,
                num_height: 50,
                keyboardtype: TextInputType.name,
                obsecure: false,
                text_hint: "Enter your location",
                img_right_padding: 20,
                img_bottom_padding: 5,
                icon_name: "assets/images/location.png",
                img_width: 10,
                img_height: 10),
            SizedBox(height: 12,),
            Textformfield_with_icon(
                controller_Name: bagsController,
                text_name: "Expired Date",
                num_width: 0.9,
                num_height: 50,
                keyboardtype: TextInputType.datetime,
                obsecure: false,
                text_hint: "Enter date",
                img_right_padding: 15,
                img_bottom_padding: 5,
                icon_name: "assets/images/blood-bag.png",
                img_width: 10,
                img_height: 10,
            ),
            SizedBox(height: 17,),
            Buttons_without_icon(num_width: 0.8,
                num_hieght: 53,
                text_button_name: "Post a request",
                button_color: Color(0xffED394A),
                num_border: 12,
                num_fontsize: 20,
                text_fontwwieght: FontWeight.normal
            ),
          ],
        ),
      ),
    );
  }
}
