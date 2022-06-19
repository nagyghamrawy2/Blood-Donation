import 'package:blood_bank/layout/home_layout.dart';
import 'package:blood_bank/modules/Forget%20Password/forgetPasswordScreen.dart';
import 'package:blood_bank/modules/Login_Screen/Cubit/Cubit.dart';
import 'package:blood_bank/modules/Login_Screen/Cubit/States.dart';
import 'package:blood_bank/modules/sign_up/SignUpForm1.dart';
import 'package:blood_bank/modules/sign_up/cubit/SignUpForm.dart';
import 'package:blood_bank/shared/Network/local/Cache_helper.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/Constant.dart';
import '../../shared/Constant.dart';
import '../../shared/styles/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  var formKey = GlobalKey<FormState>();
  String updateFcmToken="";
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getToken().then((value){
      print(value);
      setState(() {
        updateFcmToken = value!;
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginStates>(
        listener: (context, state) {
          if (state is AppLoginSuccessState) {
            if (state.login.status!) {
              govIdProfile = userDataModel?.user?.governorate?.id;
              cityIdProfile = (userDataModel?.user?.city?.id)!;
              AppCubit.get(context).valueSwitch = userDataModel?.user?.availableForDonate;
              AppCubit.get(context).getCityData(id: govIdProfile!);
              CacheHelper.SaveData(
                  key: 'govId', value: state.login.user?.governorate?.id);
              CacheHelper.SaveData(
                  key: 'cityId', value: state.login.user?.city?.id);
              token = state.login.user!.token!;
              CacheHelper.SaveData(key: 'token', value: state.login.user?.token)
                  .then((value) {
                AppLoginCubit.get(context).updateFcmUserToken(
                  fcmToken: updateFcmToken,
                );
                navigateAndFinish(context, HomeLayout());
              });
              AppCubit.get(context)..getEducationData()..getGovernorateData()..getDonorData()..getAllRequests()..getMyRequests()..getClosedRequests();
              ShowToast(text: 'LOGIN SUCCESSFULLY', state: ToastStates.SUCCESS);
            } else {
              ShowToast(
                  text: 'Please make sure the data entered is correct',
                  state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ClipPath(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 280,
                          color: mainColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Welcome back,',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Login !',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        clipper: CustomClipPath(),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Textformfield_with_border(
                          controllerName: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Enter your Email address',
                          text_label: 'Email address',
                          num_border: 10,
                          haveIcon: true,
                          iconName: 'assets/images/emaillogin.png',
                          validatorText: 'Email address must not empty',
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Textformfield_with_border(
                          controllerName: passwordcontroller,
                          keyboardType: TextInputType.visiblePassword,
                          obsecure: AppLoginCubit.get(context).obsecure,

                          hintText: 'Enter your Password',
                          text_label: 'Password',
                          num_border: 10,
                          haveIcon: true,
                          isPasswordField: true,
                          validatorText: 'Password must be not empty',
                          suffixFunction: () {
                            AppLoginCubit.get(context).changePasswordStatus();
                          },
                        ),
                      ),
                      Row(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 5),
                          //   child: Checkbox(
                          //     shape: const RoundedRectangleBorder(
                          //       borderRadius:
                          //           BorderRadius.all(Radius.circular(10)),
                          //     ),
                          //     activeColor: mainColor,
                          //     value: true,
                          //     onChanged: (value) {
                          //       cubit.changeactiveStatus(value);
                          //     },
                          //   ),
                          // ),
                          // Text('Remember me',maxLines: 1,
                          //     style: const TextStyle(
                          //         color: mainColor,
                          //         fontWeight: FontWeight.bold)),
                          Spacer(),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: const Text(
                              'don\'t have an account ?',
                              style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                     ConditionalBuilder(
                         condition: state is! AppLoginLoadingState ,
                         builder: (context) =>  Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 100.0),
                           child: Buttons_without_icon(
                               function: () {

                                 if (formKey.currentState!.validate()) {
                                   AppLoginCubit.get(context).userLogin(
                                     email: emailcontroller.text,
                                     Password: passwordcontroller.text,
                                   );
                                   print ("done");
                                 }
                               },
                               num_hieght: 52,
                               text_button_name: 'Login',
                               button_color: mainColor,
                               num_border: 25,
                               num_fontsize: 20,
                               text_fontwwieght: FontWeight.normal),
                         ),
                         fallback: (context) => Center(child: CircularProgressIndicator(color: mainColor,),)
                     ),
                    ],
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

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 130);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 130);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
