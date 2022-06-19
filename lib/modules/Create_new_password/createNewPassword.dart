import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/components/components.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  var passwordController = TextEditingController();
  var password1Controller = TextEditingController();
  var formkey=GlobalKey<FormState>();

  CreateNewPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,index){},
      builder: (context,index)
      {
        AppCubit cubit = AppCubit.get(context);
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Create new password'),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
              ],
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.0.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 180.h,
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
                          padding: EdgeInsets.only(left: 5.0, top: 10.0),
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
                      SizedBox(
                        height: 100.h,
                      ),
                      Textformfield_with_border(
                        controllerName: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obsecure: cubit.obsecure,
                        hintText: 'Enter New password',
                        text_label: 'New Password',
                        num_border: 10,
                        isPasswordField: true,
                        validatorFunction: (value){
                          if(value ==null || value.isEmpty){
                            return 'Password must not be empty';
                          }
                        },
                        suffixFunction: ()
                        {
                          cubit.changePasswordStatus();
                        },
                        haveIcon: true,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Textformfield_with_border(
                        controllerName: password1Controller,
                        keyboardType: TextInputType.visiblePassword,
                        obsecure: cubit.obsecure,
                        hintText: 'Confirm new  password',
                        text_label: 'Confirm Password',
                        num_border: 10,
                        isPasswordField: true,
                        validatorFunction: (value){
                          if(value ==null || value.isEmpty){
                            return 'Password must not be empty';
                          }
                        },
                        suffixFunction: (){
                          cubit.changePasswordStatus();
                        },
                        haveIcon: true,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Buttons_without_icon(
                          function: () {
                            if(formkey.currentState!.validate()){
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
