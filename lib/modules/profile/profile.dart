import 'package:blood_bank/modules/add_request/Add_Request.dart';
import 'package:blood_bank/modules/change%20password/Change_password.dart';
import 'package:blood_bank/modules/myInformation/myInformation.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocProvider(
        create: (context)=> AppCubit(),
        child: BlocConsumer<AppCubit,AppStates>(
            builder: (context,state){
              AppCubit cubit = AppCubit.get(context);
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15.0,),
                    const CircleAvatar(
                      radius: 70.0,
                      backgroundImage: AssetImage('assets/images/pp.png'),
                    ),
                    const SizedBox(height: 3.0,),
                    const Text('Hesham ahmed',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    const SizedBox(height: 3.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage('assets/images/location.png'),
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(width: 10.0,),
                        Text('Cairo,Helwan'),
                      ],
                    ),
                    const SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 175,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: mainColor,
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Add_Request()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage('assets/images/blood-bag.png'),
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 10.0,),
                                Text('Donate Blood',style: TextStyle(color: Colors.white,),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 175,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: mainColor,
                                width: 2.0
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  RequestScreen()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage('assets/images/requests.png'),
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 10.0,),
                                Text('Request'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 107,
                          height: 59,
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('A+'),
                              Text('Blood Type'),
                            ],
                          ),
                        ),
                        Container(
                          width: 107,
                          height: 59,
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('04'),
                              Text('donations'),
                            ],
                          ),
                        ),
                        Container(
                          width: 107,
                          height: 59,
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('03'),
                              Text('requests'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 29.0,),
                    Container_with_button(
                      have_switch: true,
                      cubitValueSwitch: cubit.valueSwitch,
                      function: (value){
                        print(value);
                        cubit.changeValueSwitch(value);
                      },
                      img_left_padding: 13,
                      icon_name: 'assets/images/profile.png',
                      img_width: 35,
                      img_height: 35,
                      label_name: 'Availabe to donate',
                    ),
                    const SizedBox(height: 14.0,),
                    Container_with_button(
                      img_left_padding: 13,
                      icon_name: 'assets/images/invite.png',
                      img_width: 35,
                      img_height: 35,
                      label_name: 'Invite a friend',
                      function: (){},
                    ),
                    const SizedBox(height: 14.0,),
                    Container_with_button(
                      img_left_padding: 13,
                      icon_name: 'assets/images/information.png',
                      img_width: 35,
                      img_height: 35,
                      label_name: 'My Information',
                      function: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyInformationScreen()),
                        );
                      }
                    ),
                    const SizedBox(height: 14.0,),
                    Container_with_button(
                      img_left_padding: 13,
                      icon_name: 'assets/images/chat.png',
                      img_width: 35,
                      img_height: 35,
                      label_name: 'Chats',
                      function: (){},
                    ),
                    const SizedBox(height: 14.0,),
                    Container_with_button(
                      img_left_padding: 13,
                      icon_name: 'assets/images/lock_profile.png',
                      img_width: 30,
                      img_height: 30,
                      label_name: 'Change password',
                      function: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 14.0,),
                    Container_with_button(
                      img_left_padding: 13,
                      icon_name: 'assets/images/profile.png',
                      img_width: 35,
                      img_height: 35,
                      label_name: 'Sign out',
                      function: (){},
                    ),
                    const SizedBox(height: 14.0,),
                  ],
                ),
              );
            },
            listener: (context,state){},
        ),
      ),
    );
  }
}
