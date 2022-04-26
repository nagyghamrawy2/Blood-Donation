import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  var passwordcontroller = TextEditingController();
  var password2controller = TextEditingController();
  var password3controller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, index) {},
        builder: (context, index) {
          AppCubit cubit = AppCubit.get(context);
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Change Password'),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
                ],
              ),
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.0.h,
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 175.h,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset:
                                        const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                color: mainColor,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(25.0),
                                  bottomLeft: Radius.circular(25.0),
                                )),
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.0, top: 5.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '* MAKE YOUR PASSWORD LONG.\n* MAKE YOUR PASSWORD A NONSENSE PHRASE.\n* INCLUDE NUMBERS,SYMBOLS.\n* AVOID USING OBVIOUS PERSONAL INFORMATION.\n* DO NOT REUSE PASSWORDS.',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp,),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        Textformfield_with_border(
                          controllerName: passwordcontroller,
                          keyboardType: TextInputType.visiblePassword,
                          obsecure: cubit.obsecure,
                          hintText: 'Enter old  password',
                          text_label: 'Old Password',
                          num_border: 10,
                          isPasswordField: true,
                          validatorText: 'Password must not be empty',
                          suffixFunction: () {
                            cubit.changePasswordStatus();
                          },
                          haveIcon: true,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Textformfield_with_border(
                          controllerName: password2controller,
                          keyboardType: TextInputType.visiblePassword,
                          obsecure: cubit.obsecure,
                          hintText: 'Enter New password',
                          text_label: 'New Password',
                          num_border: 10,
                          isPasswordField: true,
                          validatorText: 'Password must not be empty',
                          suffixFunction: ()
                          {
                            cubit.changePasswordStatus();
                          },
                          haveIcon: true,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Textformfield_with_border(
                          controllerName: password3controller,
                          keyboardType: TextInputType.visiblePassword,
                          obsecure: cubit.obsecure,
                          hintText: 'Confirm password',
                          text_label: 'Confirm New Password',
                          num_border: 10,
                          isPasswordField: true,
                          validatorText: 'Password must not be empty',
                          suffixFunction: ()
                          {
                            cubit.changePasswordStatus();
                          },
                          haveIcon: true,
                        ),
                         SizedBox(
                          height: 40.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Buttons_without_icon(
                              function: () {
                                if(formKey.currentState!.validate()){
                                  print('done');
                                }else{
                                  print('not done');
                                }
                              },
                              num_hieght: 52,
                              text_button_name: 'Change Password',
                              button_color: mainColor,
                              num_border: 11,
                              num_fontsize: 20,
                              text_fontwwieght: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
