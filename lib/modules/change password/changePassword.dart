import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return Scaffold(
            appBar: AppBar(
              title: const Text('Change Password'),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
              ],
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.15,
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 5.0, top: 5.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '* MAKE YOUR PASSWORD LONG.\n* MAKE YOUR PASSWORD A NONSENSE PHRASE.\n* INCLUDE NUMBERS,SYMBOLS.\n* AVOID USING OBVIOUS PERSONAL INFORMATION.\n* DO NOT REUSE PASSWORDS.',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13,),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
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
                    const SizedBox(
                      height: 30,
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
                    const SizedBox(
                      height: 30,
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
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                          text_fontwwieght: FontWeight.normal),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
