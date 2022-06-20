import 'package:blood_bank/modules/bloodBank/bloodBankScreen.dart';
import 'package:blood_bank/modules/editProfile/editProfile.dart';
import 'package:blood_bank/modules/education/education.dart';
import 'package:blood_bank/modules/findDonor/findDonorScreen.dart';
import 'package:blood_bank/modules/myInformation/myInformation.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../add_request/addRequest.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
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
                      CircleAvatar(
                        backgroundImage: NetworkImage(imageUserLogin),
                        backgroundColor: Colors.transparent,
                        radius: 50,
                      ),
                      const SizedBox(width: 5,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          'Hello ${userDataModel?.user?.name} !\nHow are you?',
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FindDonorScreen()),
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
                                    children: const [
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
                                  MaterialPageRoute(builder: (context) => AddRequestScreen()),
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
                                    children: const [
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
                                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
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
                                    children: const [
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
                                    children: const [
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
                                  MaterialPageRoute(builder: (context) => BloodBankScreen()),
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
                                    children: const [
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
                  Container(
                    height: 200.h,
                    width: 300.w,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => EducationInfo(index: index),
                        separatorBuilder: (context, index) => SizedBox(width: 30,),
                        itemCount: cubit.educationItemData.length
                    ),
                  ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       InkWell(
                  //         onTap:(){},
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Container(
                  //               height: 120,
                  //               width: MediaQuery.of(context).size.width * 0.5,
                  //               color: Colors.black,
                  //               child: const Image(
                  //                 image: const AssetImage(
                  //                   'assets/images/educationImage.png',
                  //                 ),
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //             Container(
                  //               width: MediaQuery.of(context).size.width * 0.5,
                  //               child: const Text(
                  //                 'important of blood donation',
                  //                 style: TextStyle(color: Colors.black),
                  //                 overflow: TextOverflow.ellipsis,
                  //                 maxLines: 1,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       const SizedBox(width: 30,),
                  //       InkWell(
                  //         onTap:(){},
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Container(
                  //               height: 120,
                  //               width: MediaQuery.of(context).size.width * 0.5,
                  //               color: Colors.black,
                  //               child: const Image(
                  //                 image: const AssetImage(
                  //                   'assets/images/educationImage.png',
                  //                 ),
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //             Container(
                  //               width: MediaQuery.of(context).size.width * 0.5,
                  //               child: const Text(
                  //                 'important of blood donation',
                  //                 style: TextStyle(color: Colors.black),
                  //                 overflow: TextOverflow.ellipsis,
                  //                 maxLines: 1,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       const SizedBox(width: 30,),
                  //       InkWell(
                  //         onTap:(){},
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Container(
                  //               height: 120,
                  //               width: MediaQuery.of(context).size.width * 0.5,
                  //               color: Colors.black,
                  //               child: const Image(
                  //                 image: const AssetImage(
                  //                   'assets/images/educationImage.png',
                  //                 ),
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //             Container(
                  //               width: MediaQuery.of(context).size.width * 0.5,
                  //               child: const Text(
                  //                 'important of blood donation',
                  //                 style: TextStyle(color: Colors.black),
                  //                 overflow: TextOverflow.ellipsis,
                  //                 maxLines: 1,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
