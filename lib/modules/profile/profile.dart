import 'package:blood_bank/modules/add_request/addRequest.dart';
import 'package:blood_bank/modules/change%20password/changePassword.dart';
import 'package:blood_bank/modules/myInformation/myInformation.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/shared/Constant.dart';
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
      body: BlocConsumer<AppCubit,AppStates>(
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
                  const Text('Hesham ahmed',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) =>  Add_Request()),
                            // );
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
                              MaterialPageRoute(builder: (context) =>  const RequestScreen()),
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
                  ProfileButton(
                    switchFun: (value){
                      cubit.changeValueSwitch(value);
                    },
                    have_switch: true,
                    cubitValueSwitch: cubit.valueSwitch,
                    function: (){},
                    icon_name: 'assets/images/profile.png',
                    img_width: 35,
                    img_height: 35,
                    label_name: 'Availabe to donate',
                  ),
                  const SizedBox(height: 14.0,),
                  ProfileButton(
                    icon_name: 'assets/images/invite.png',
                    img_width: 35,
                    img_height: 35,
                    label_name: 'Invite a friend',
                    function: (){},
                  ),
                  const SizedBox(height: 14.0,),
                  ProfileButton(
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
                  ProfileButton(
                    icon_name: 'assets/images/chat.png',
                    img_width: 35,
                    img_height: 35,
                    label_name: 'Chats',
                    function: (){},
                  ),
                  const SizedBox(height: 14.0,),
                  ProfileButton(
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
                  ProfileButton(
                    icon_name: 'assets/images/profile.png',
                    img_width: 35,
                    img_height: 35,
                    label_name: 'Sign out',
                    function: (){Signout(context);},
                  ),
                  const SizedBox(height: 14.0,),
                ],
              ),
            );
          },
          listener: (context,state){},
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  ProfileButton({
    Key? key,
    required this.icon_name,
    required this.img_width,
    required this.img_height,
    required this.label_name,
    this.have_switch = false,
    this.cubitValueSwitch = false,
    required this.function,
    this.switchFun,
  }) : super(key: key);

  late String icon_name;
  late double img_width;
  late double img_height;
  late String label_name;
  final bool have_switch;
  bool cubitValueSwitch;
  Function(bool val)? switchFun;
  late Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          width: double.infinity,
          height: 43,
          color: Colors.black26,
          child: have_switch
              ? Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 13,
                ),
                child: Image.asset(
                  icon_name,
                  width: img_width,
                  height: img_height,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  label_name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Switch.adaptive(
                activeColor: Colors.green,
                inactiveTrackColor: Colors.red,
                value: cubitValueSwitch,
                onChanged: (value) {
                  switchFun!(value);
                },
              ),
            ],
          )
              : Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 13,
                ),
                child: Image.asset(
                  icon_name,
                  width: img_width,
                  height: img_height,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  label_name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
