import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/states.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: mainColor,
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
                    SizedBox(height: 15.0,),
                    CircleAvatar(
                      radius: 70.0,
                    ),
                    SizedBox(height: 3.0,),
                    Text('Hesham ahmed'),
                    SizedBox(height: 3.0,),
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
                    SizedBox(height: 10.0,),
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
                            onPressed: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/blood-bag.png'),
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 10.0,),
                                Text('Donate Blood'),
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
                            onPressed: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/requests.png'),
                                  height: 30,
                                  width: 30,
                                ),
                                SizedBox(width: 10.0,),
                                Text('Donate Blood'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.0,),
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
                            children: [
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
                            children: [
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
                            children: [
                              Text('03'),
                              Text('requests'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 29.0,),
                    // Switch.adaptive(
                    //   activeColor: Colors.green,
                    //   inactiveTrackColor: Colors.red,
                    //   value: cubit.valueSwitch,
                    //   onChanged: (value){
                    //     cubit.changeValueSwitch(value);
                    //   },
                    // ),
                    Container_with_button(
                      have_switch: true,
                      cubitValueSwitch: cubit.valueSwitch,
                      function: (value){
                        cubit.changeValueSwitch(value);
                      },
                      num_width: 382,
                      img_left_padding: 13,
                      icon_name: 'assets/images/profile.png',
                      img_width: 35,
                      img_height: 35,
                      label_name: 'Availbe to donate',
                    ),
                    SizedBox(height: 14.0,),
                    Container_with_button(
                      num_width: 382,
                      img_left_padding: 13,
                      icon_name: 'assets/images/invite.png',
                      img_width: 35,
                      img_height: 35,
                      label_name: 'Invite a friend',
                    ),
                    SizedBox(height: 14.0,),
                    Container_with_button(
                      num_width: 382,
                      img_left_padding: 13,
                      icon_name: 'assets/images/information.png',
                      img_width: 35,
                      img_height: 35,
                      label_name: 'My Information',
                    ),
                    SizedBox(height: 14.0,),
                    Container_with_button(
                      num_width: 382,
                      img_left_padding: 13,
                      icon_name: 'assets/images/chat.png',
                      img_width: 35,
                      img_height: 35,
                      label_name: 'Chats',
                    ),
                    SizedBox(height: 14.0,),
                    Container_with_button(
                      num_width: 382,
                      img_left_padding: 13,
                      icon_name: 'assets/images/lock_profile.png',
                      img_width: 30,
                      img_height: 30,
                      label_name: 'Change password',
                    ),
                    SizedBox(height: 14.0,),
                    Container_with_button(
                      num_width: 382,
                      img_left_padding: 13,
                      icon_name: 'assets/images/profile.png',
                      img_width: 35,
                      img_height: 35,
                      label_name: 'Sign out',
                    ),
                    SizedBox(height: 14.0,),
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
