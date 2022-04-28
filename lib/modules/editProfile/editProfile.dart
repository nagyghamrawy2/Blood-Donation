import 'package:blood_bank/models/profile_model.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  var name = TextEditingController();
  var emailAddress = TextEditingController();
  var phone = TextEditingController();
  var govId = TextEditingController();
  var cityId = TextEditingController();
  var birthDate = TextEditingController();
  var donationDate = TextEditingController();
  var bloodType = TextEditingController();
  var height = TextEditingController();
  var weight = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    User? model = cubit.profileModel?.user;
    name = TextEditingController(text: model?.name);
    emailAddress = TextEditingController(text: model?.email);
    phone = TextEditingController(text: model?.phoneNumber);
    govId = TextEditingController();
    cityId = TextEditingController();
    birthDate = TextEditingController(text: model?.dateOfBirth);
    donationDate = TextEditingController(text: model?.donationDate);
    bloodType = TextEditingController(text: model?.bloodType);
    height = TextEditingController(text: model?.height.toString());
    weight = TextEditingController(text: model?.weight);
     return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        String image = model?.profilePicture != null
            ? '${model?.profilePicture}'
            : 'assets/images/noImage.png';
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit profile'),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage(image),
                ),
                const SizedBox(
                  height: 5,
                ),
                Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          SignupTextField(
                            hintText: 'Enter your name',
                            text: 'Name',
                            controller: name,
                            keyboardtype: TextInputType.text,
                            validatorText: 'Name must not be empty',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SignupTextField(
                            hintText: 'Enter your email',
                            text: 'Email',
                            controller: emailAddress,
                            keyboardtype: TextInputType.emailAddress,
                            validatorText: 'Email must not be empty',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SignupTextField(
                            hintText: 'Enter your phone number',
                            text: 'Phone',
                            controller: phone,
                            keyboardtype: TextInputType.phone,
                            validatorText: 'Phone must not be empty',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: double.infinity,
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Birth Date',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: birthDate,
                                      keyboardType: TextInputType.datetime,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Birthdate must not be empty';
                                        }
                                      },
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate:
                                              DateTime.parse(birthDate.text,),
                                          firstDate: DateTime(1900),
                                          lastDate:
                                              DateTime.parse('2025-05-05'),
                                        ).then((value) {
                                          birthDate.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(value!);
                                        },);
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: greyColor,
                                            )),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        hintText: 'Enter your birthdate',
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: double.infinity,
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Last donation date',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: donationDate,
                                      keyboardType: TextInputType.datetime,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Last donation date must not be empty';
                                        }
                                      },
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate:
                                              DateTime.parse(donationDate.text,),
                                          firstDate: DateTime(1900),
                                          lastDate:
                                              DateTime.parse('2025-05-05'),
                                        ).then((value) {
                                          donationDate.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(value!);
                                        },);
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: greyColor,
                                            )),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        hintText: 'Enter your birthdate',
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Blood group',
                                style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27.sp,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.008,
                              ),
                              DropdownButtonFormField<String>(
                                value: bloodType.text,
                                items: cubit.bloodGroupItem.map((label) => DropdownMenuItem(
                                    child: Text(
                                      label,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    value: label,
                                  )).toList(),
                                onChanged: (value) {
                                  bloodType.text = value!;
                                },
                                validator: (value){
                                  if (value == null) {
                                    return "Blood type must not be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                hint: const Text('Blood type'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SignupTextField(
                            hintText: 'Enter your Weight',
                            text: 'Weight',
                            controller: weight,
                            keyboardtype: TextInputType.number,
                            validatorText: 'Weight must not be empty',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SignupTextField(
                            hintText: 'Enter your Height',
                            text: 'Height',
                            controller: height,
                            keyboardtype: TextInputType.number,
                            validatorText: 'Height must not be empty',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Buttons_without_icon(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.updateUserData(
                                  name: name.text,
                                  email: emailAddress.text,
                                  phone: phone.text,
                                  dateOfBirth: birthDate.text,
                                  bloodType: bloodType.text,
                                  govId: 2,
                                  cityId: 2,
                                  height: int.parse(height.text),
                                  weight: weight.text,
                                  lastDonateDate: donationDate.text,
                                );
                                print('done');
                              } else {
                                print('not done');
                              }
                            },
                            num_hieght: 52,
                            text_button_name: 'Save data',
                            button_color: mainColor,
                            num_border: 12,
                            num_fontsize: 20,
                            text_fontwwieght: FontWeight.normal,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
