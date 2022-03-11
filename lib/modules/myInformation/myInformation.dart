import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class MyInformation extends StatelessWidget {
  const MyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  height: 270,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: AssetImage('assets/images/pp.png'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hesham Ahmed',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 230),
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    child: ListView.separated(
                      itemBuilder: (context, index) => InformationOfProfile(
                          label: 'Email', leftLabel: 'atch71200@gmail.com'),
                      separatorBuilder: (context, index) => Divider(
                        color: greyColor2,
                        thickness: 1,
                        indent: 30,
                        endIndent: 30,
                      ),
                      itemCount: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: greyColor2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Buttons_without_icon(
              num_width: 0.8,
              num_hieght: 50,
              text_button_name: 'Edit Profile',
              button_color: mainColor,
              num_border: 12,
              num_fontsize: 20,
              text_fontwwieght: FontWeight.normal,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
