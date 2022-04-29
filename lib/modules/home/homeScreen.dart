import 'package:blood_bank/modules/bloodBank/bloodBankScreen.dart';
import 'package:blood_bank/modules/editProfile/editProfile.dart';
import 'package:blood_bank/modules/education/education.dart';
import 'package:blood_bank/modules/findDonor/findDonorScreen.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../add_request/addRequest.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
              onPressed: (){}, icon: const Icon(Icons.notifications),color: Colors.black,iconSize: 40,
          )
        ],
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pp.png'),
                    radius: 50,
                  ),
                  const SizedBox(width: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Text(
                      'Hello Hesham Ahmed !\nHow are you?',
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
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 1,
                child: Container(
                  width: double.infinity,
                  height: 215,
                  child: const Image(
                    image: AssetImage('assets/images/homeImage.png'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: DottedLine(
                  dashColor: mainColor,
                ),
              ),
              Container(
                width: double.infinity,
                height: 210,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: greyColor2),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 0.1,
                      blurRadius: 2,
                      offset: Offset(2,3),
                    ),
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) =>  FindDonorScreen()),
                            // );
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
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/findDonor.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  const Text('Find donor'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Add_Request()),
                            // );
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
                                  const Image(
                                    image: const AssetImage(
                                        'assets/images/postRequest.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  const Text('Post request'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => EditProfileScreen()),
                            // );
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
                                  const Image(
                                    image:
                                        const AssetImage('assets/images/edit.png'),
                                    width: 40,
                                    height: 40,
                                  ),
                                  const Text('Edit profile'),
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
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/requests.png'),
                                    width: 40,
                                    height: 40,
                                  ),
                                  const Text('Browse requests'),
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
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/bloodBank.png'),
                                    width: 45,
                                    height: 45,
                                  ),
                                  const Text('Browse bloodBank'),
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Education',
                    style: const TextStyle(
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
                    child: const Text(
                      'view all',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
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
                            child: const Image(
                              image: const AssetImage(
                                'assets/images/educationImage.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: const Text(
                              'important of blood donation',
                              style: TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30,),
                    InkWell(
                      onTap:(){},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Colors.black,
                            child: const Image(
                              image: const AssetImage(
                                'assets/images/educationImage.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: const Text(
                              'important of blood donation',
                              style: TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30,),
                    InkWell(
                      onTap:(){},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: Colors.black,
                            child: const Image(
                              image: const AssetImage(
                                'assets/images/educationImage.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: const Text(
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
