import 'package:blood_bank/modules/bloodBank/bloodBankScreen.dart';
import 'package:blood_bank/modules/editProfile/editProfile.dart';
import 'package:blood_bank/modules/education/education.dart';
import 'package:blood_bank/modules/findDonor/findDonorScreen.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../add_request/Add_Request.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pp.png'),
                    radius: 50,
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'Hello Hesham Ahmed ! How are you?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                elevation: 1,
                child: Container(
                  width: double.infinity,
                  height: 215,
                  child: Image(
                    image: AssetImage('assets/images/homeImage.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: DottedLine(
                  dashColor: mainColor,
                ),
              ),
              Card(
                elevation: 3,
                child: Container(
                  width: double.infinity,
                  height: 210,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: greyColor2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  FindDonorScreen()),
                              );
                            },
                            child: Card(
                              elevation: 3,
                              child: Container(
                                height: 75,
                                width: MediaQuery.of(context).size.width*0.25,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: greyColor2),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/findDonor.png'),
                                      width: 50,
                                      height: 50,
                                    ),
                                    Text('Find donor'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Add_Request()),
                              );
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                height: 75,
                                width: MediaQuery.of(context).size.width*0.25,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: greyColor2),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/postRequest.png'),
                                      width: 50,
                                      height: 50,
                                    ),
                                    Text('Post request'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EditProfile()),
                              );
                            },
                            child: Card(
                              elevation: 3,
                              child: Container(
                                height: 75,
                                width: MediaQuery.of(context).size.width*0.25,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: greyColor2),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('assets/images/edit.png'),
                                      width: 40,
                                      height: 40,
                                    ),
                                    Text('Edit profile'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RequestScreen()),
                              );
                            },
                            child: Card(
                              elevation: 3,
                              child: Container(
                                height: 75,
                                width: MediaQuery.of(context).size.width*0.35,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: greyColor2),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/requests.png'),
                                      width: 40,
                                      height: 40,
                                    ),
                                    Text('Browse requests'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const BloodBankScreen()),
                              );
                            },
                            child: Card(
                              elevation: 3,
                              child: Container(
                                height: 75,
                                width: MediaQuery.of(context).size.width*0.40,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: greyColor2),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/bloodBank.png'),
                                      width: 45,
                                      height: 45,
                                    ),
                                    Text('Browse bloodBank'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Education',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EducationScreen()),
                      );
                    },
                    child: Text(
                      'view all',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap:(){},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Colors.black,
                            child: Image(
                              image: AssetImage(
                                'assets/images/educationImage.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              'important of blood donation',
                              style: TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30,),
                    InkWell(
                      onTap:(){},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Colors.black,
                            child: Image(
                              image: AssetImage(
                                'assets/images/educationImage.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              'important of blood donation',
                              style: TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30,),
                    InkWell(
                      onTap:(){},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Colors.black,
                            child: Image(
                              image: AssetImage(
                                'assets/images/educationImage.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              'important of blood donation',
                              style: TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
