import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class MyInformation extends StatelessWidget {
  MyInformation({Key? key}) : super(key: key);

  final List<String> label = [
    'Email',
    'Phone',
    'Location',
    'Birth date',
    'Blood type',
    'Weight',
    'Height',
  ];
  final List<String> ApiInfo = [
    'Atch71200@gmail.com',
    '01101171298',
    'helwan,cairo',
    '7/12/1998',
    'A+',
    '94 kg',
    '192 cm',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Information',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Column(
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
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 240),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.48,
                    width: double.infinity,
                    child: ListView.separated(
                      itemBuilder: (context, index) => InformationOfProfile(
                          label: label[index], leftLabel: ApiInfo[index],
                      ),
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
            SizedBox(height: 15
              ,),
            Buttons_without_icon(
              num_width: 0.8,
              num_hieght: 50,
              text_button_name: 'Edit Profile',
              button_color: mainColor,
              num_border: 12,
              num_fontsize: 20,
              text_fontwwieght: FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}
