import 'dart:convert';
import 'dart:io';

import 'package:blood_bank/models/profile_model.dart';
import 'package:blood_bank/modules/home/homeScreen.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/Network/local/Cache_helper.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var name = TextEditingController(text: userDataModel?.user?.name);
  var emailAddress = TextEditingController(text: userDataModel?.user?.email);
  var phone = TextEditingController(text: userDataModel?.user?.phoneNumber);
  var birthDate = TextEditingController(text: userDataModel?.user?.dateOfBirth);
  var donationDate =
      TextEditingController(text: userDataModel?.user?.donationDate);
  var bloodType = TextEditingController(text: userDataModel?.user?.bloodType);
  var height =
      TextEditingController(text: userDataModel?.user?.height.toString());
  var weight = TextEditingController(text: userDataModel?.user?.weight);
  var formKey = GlobalKey<FormState>();
  int? id;
  File? x;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSuccessUpdateUserDataState) {
          Navigator.pop(context);
        }
        if (state is AppSuccessCityDataState) {
          int id2 = cityItemList.indexWhere(
              (element) => element.cityName == cityItemList[0].cityName);
          cityIdProfile = (cityItemList[id2].id)!;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit profile'),
          ),
          body: ConditionalBuilder(
            condition: cityItemList.isNotEmpty,
            builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        (imagePath == null)
                            ? CircleAvatar(
                                radius: 75,
                                backgroundImage: NetworkImage(image),
                              )
                            : CircleAvatar(
                                radius: 75,
                                backgroundImage: FileImage(x!),
                              ),
                        Positioned(
                          right: 50,
                          bottom: 1.5,
                          child: Container(
                            height: 20,
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Add photo"),
                                        content: Text("choose one"),
                                        actions: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            onPressed: () async {
                                              ImagePicker a = new ImagePicker();
                                              dynamic b = await a.getImage(
                                                  source: ImageSource.gallery);
                                              imagePath = b.path;
                                              setState(() {
                                                x = File(b.path);
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Gallery'),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            onPressed: () async {
                                              ImagePicker a = new ImagePicker();
                                              dynamic b = await a.getImage(
                                                  source: ImageSource.camera);
                                              imagePath = b.path;
                                              setState(() {
                                                x = File(b.path);
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Camera'),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('close'),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.add_a_photo, size: 35),
                            ),
                          ),
                        ),
                      ],
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
                                validatorFunction: (value) {
                                  if (value == null || value.isEmpty) {
                                    'Name must not be empty';
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SignupTextField(
                                hintText: 'Enter your email',
                                text: 'Email',
                                controller: emailAddress,
                                keyboardtype: TextInputType.emailAddress,
                                validatorFunction: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your email";
                                  }
                                  if (!value.contains("@") &&
                                      !value.contains(".com")) {
                                    return "The email must be a valid email address";
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SignupTextField(
                                hintText: 'Enter your phone number',
                                text: 'Phone',
                                controller: phone,
                                keyboardtype: TextInputType.phone,
                                validatorFunction: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  if (value.length != 11) {
                                    return "Please enter valid phone";
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: double.infinity,
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Birthdate must not be empty';
                                            }
                                          },
                                          onTap: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate:
                                                  DateTime.parse('2004-12-01'),
                                              firstDate: DateTime(1957),
                                              lastDate:
                                                  DateTime.parse('2004-12-31'),
                                            ).then((value) {
                                              birthDate.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(value!);
                                            });
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
                                            focusedErrorBorder:
                                                OutlineInputBorder(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Last donation date must not be empty';
                                            }
                                            return null;
                                          },
                                          // onTap: () {
                                          //   showDatePicker(
                                          //     context: context,
                                          //     initialDate: DateTime.now(),
                                          //     firstDate: DateTime(2018),
                                          //     lastDate: DateTime.now(),
                                          //   ).then((value) {
                                          //     lastDonationDate.text =
                                          //         DateFormat('yyyy-MM-dd')
                                          //             .format(value!);
                                          //   });
                                          // },
                                          onTap: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.parse(
                                                donationDate.text,
                                              ),
                                              firstDate: DateTime(1900),
                                              lastDate:
                                                  DateTime.parse('2025-05-05'),
                                            ).then(
                                              (value) {
                                                donationDate.text =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(value!);
                                              },
                                            );
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
                                            focusedErrorBorder:
                                                OutlineInputBorder(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Governorate',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      DropdownButtonFormField(
                                        value: governorateItemList[
                                                govIdProfile! - 1]
                                            .governorateName,
                                        hint: const Text(
                                          'Governorate',
                                        ),
                                        validator: (value) {
                                          value ??
                                              "Governorate must not be empty";
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          focusColor: Colors.green,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: greyColor,
                                            ),
                                          ),
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: governorateItemList
                                            .asMap()
                                            .entries
                                            .map((items) {
                                          return DropdownMenuItem(
                                            value: items.value.governorateName,
                                            child: Text(
                                                items.value.governorateName!),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          id = governorateItemList.indexWhere(
                                              (element) =>
                                                  element.governorateName ==
                                                  newValue);
                                          govIdProfile =
                                              governorateItemList[id!].id;
                                          cubit.getCityData(id: govIdProfile!);
                                          idIndexOfCity = 0;
                                          print(cityIdProfile);
                                        },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'City',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      DropdownButtonFormField(
                                        value: cityItemList[idIndexOfCity!]
                                            .cityName,
                                        hint: const Text(
                                          'City',
                                        ),
                                        validator: (value) {
                                          if (value == null) {
                                            return "City must not be empty";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          focusColor: Colors.green,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              color: greyColor,
                                            ),
                                          ),
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
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: cityItemList
                                            .asMap()
                                            .entries
                                            .map((items) {
                                          return DropdownMenuItem(
                                            value: items.value.cityName,
                                            child: Text(items.value.cityName!),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          int id = cityItemList.indexWhere(
                                              (element) =>
                                                  element.cityName == newValue);
                                          idIndexOfCity = id;
                                          print(idIndexOfCity);
                                          print(cityItemList[idIndexOfCity!]
                                              .cityName);
                                          cityIdProfile =
                                              (cityItemList[id].id)!;
                                        },
                                      )
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
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.008,
                                  ),
                                  DropdownButtonFormField<String>(
                                    value: bloodType.text,
                                    items: cubit.bloodGroupItem
                                        .map((label) => DropdownMenuItem(
                                              child: Text(
                                                label,
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                              value: label,
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      bloodType.text = value!;
                                    },
                                    validator: (value) {
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
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
                                validatorFunction: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Weight must not be empty';
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SignupTextField(
                                hintText: 'Enter your Height',
                                text: 'Height',
                                controller: height,
                                keyboardtype: TextInputType.number,
                                validatorFunction: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Height must not be empty';
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ConditionalBuilder(
                                condition: state
                                        is! AppLoadingUpdateUserDataState ||
                                    state
                                        is! AppLoadingUpdatePictureUserDataState,
                                builder: (context) => Buttons_without_icon(
                                  function: () {
                                    if (formKey.currentState!.validate() &&
                                        imagePath == null) {
                                      cubit.updateUserData(
                                        name: name.text,
                                        email: emailAddress.text,
                                        phone: phone.text,
                                        dateOfBirth: birthDate.text,
                                        bloodType: bloodType.text,
                                        govId: govIdProfile!,
                                        cityId: cityIdProfile!,
                                        height: int.parse(height.text),
                                        weight: weight.text,
                                        lastDonateDate: donationDate.text,
                                        //profilePicture:  x,
                                      );
                                      // Upload();

                                      print("hhhhhh");
                                      // cubit.updateProfilePictureUserData(
                                      //   profilePicture: x,
                                      // )

                                      print(govIdProfile);
                                      print(cityIdProfile);
                                      // print(idIndexOfCity);
                                      // CacheHelper.SaveData(key: 'govId', value: govIdConstant);
                                      // CacheHelper.SaveData(key: 'cityId', value: cityIdConstant);
                                      print('done');
                                    } else if (formKey.currentState!
                                            .validate() &&
                                        imagePath != null) {
                                      cubit.uploadPP(
                                          imagePath!,
                                          name.text,
                                          emailAddress.text,
                                          phone.text,
                                          birthDate.text,
                                          bloodType.text,
                                          govIdProfile!,
                                          cityIdProfile!,
                                          weight.text,
                                          int.parse(height.text),
                                          donationDate.text);

                                      print("done with image");
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
                                fallback: (context) =>
                                    Center(child: CircularProgressIndicator()),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              );
            },
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: mainColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
