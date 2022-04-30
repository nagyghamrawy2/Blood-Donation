import 'package:blood_bank/models/profile_model.dart';
import 'package:blood_bank/modules/editProfile/editProfile.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyInformationScreen extends StatelessWidget {
  MyInformationScreen({Key? key}) : super(key: key);

  final List<String> label = [
    'Email',
    'Phone number',
    'Location',
    'Birth date',
    'Blood type',
    'Weight',
    'Height',
  ];


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        List<String> apiInfo = [
          '${profileModel?.user?.email}',
          '${profileModel?.user?.phoneNumber}',
          '${profileModel?.user?.city?.cityName},${profileModel?.user?.governorate?.governorateName}',
          '${profileModel?.user?.dateOfBirth}',
          '${profileModel?.user?.bloodType}',
          profileModel?.user?.weight != null ? '${profileModel?.user?.weight} KG' : '',
          profileModel?.user?.height != null ? '${profileModel?.user?.height} CM' : '',
        ];
        String image = profileModel?.user?.profilePicture != null ? '${profileModel?.user?.profilePicture}' : 'assets/images/noImage.png';
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
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40.0,top: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 90,
                              backgroundImage: AssetImage(image),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${profileModel?.user?.name}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40, top: 240),
                      child: Container(
                        width: double.infinity,
                        child: ListView.separated(
                          padding: const EdgeInsets.only(bottom: 10),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ProfileInfo(
                            label: label[index], leftLabel: apiInfo[index],
                          ),
                          separatorBuilder: (context, index) => const Divider(
                            color: greyColor2,
                            thickness: 1,
                            indent: 30,
                            endIndent: 30,
                          ),
                          itemCount: label.length,
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
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Buttons_without_icon(
                    num_hieght: 50,
                    text_button_name: 'Edit Profile',
                    button_color: mainColor,
                    num_border: 12,
                    num_fontsize: 20,
                    text_fontwwieght: FontWeight.normal,
                    function: (){
                      print(cityIdConstant);
                      print(govIdConstant);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  EditProfileScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProfileInfo extends StatelessWidget {
  ProfileInfo({
    Key? key,
    required this.label,
    required this.leftLabel,
  }) : super(key: key);

  late String label;
  late String leftLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
                '$label',
              )),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              '$leftLabel',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

