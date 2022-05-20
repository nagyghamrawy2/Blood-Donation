import 'package:blood_bank/layout/home_layout.dart';
import 'package:blood_bank/modules/request/myRequestScreen.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../shared/Constant.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class EditRequestScreen extends StatefulWidget {
  @override
  State<EditRequestScreen> createState() => _EditRequestScreenState();
}

class _EditRequestScreenState extends State<EditRequestScreen> {
  TextEditingController titleController = TextEditingController(
      text: myRequestModel!.requests![indexOfMyRequest!].title);
  TextEditingController descriptionController = TextEditingController(
      text: myRequestModel!.requests![indexOfMyRequest!].description);
  TextEditingController phoneController = TextEditingController(
      text: myRequestModel!.requests![indexOfMyRequest!].phoneNumber);
  TextEditingController bloodBagsController = TextEditingController(
      text: myRequestModel!.requests![indexOfMyRequest!].noOfBags.toString());
  TextEditingController expiredDateController = TextEditingController(
      text: myRequestModel!.requests![indexOfMyRequest!].requestExpiredDate);
  TextEditingController bloodTypeController = TextEditingController(
      text: myRequestModel!.requests![indexOfMyRequest!].bloodType);
  var govIdForRequest =
      myRequestModel!.requests![indexOfMyRequest!].governorate?.id;
  var cityIdForRequest = myRequestModel!.requests![indexOfMyRequest!].city?.id;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSuccessUpdateRequestsDataState) {
          cubit.getAllRequests();
          cubit.getMyRequests();
          cubit.getClosedRequests();
          Navigator.pop(
              context
          );
        }
        if (state is AppSuccessCityEditRequestDataState) {
          int id2 = cubit.cityEditRequestItemList.indexWhere((element) =>
          element.cityName == cubit.cityEditRequestItemList[0].cityName);
          cityIdForRequest = (cubit.cityEditRequestItemList[id2].id)!;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Request'),
          ),
          body: ConditionalBuilder(
            condition: cubit.cityEditRequestItemList.isNotEmpty,
            builder: (context) =>
                SingleChildScrollView(
                  child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Column(
                          children: [
                            SignupTextField(
                                hintText: 'Enter request\'s title',
                                text: 'Title',
                                controller: titleController,
                                keyboardtype: TextInputType.text,
                                validatorFunction: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Title must not be empty';
                                  }
                                }),
                            const SizedBox(height: 10),
                            SignupTextField(
                              hintText: 'Enter request\'s description',
                              text: 'Description',
                              controller: descriptionController,
                              keyboardtype: TextInputType.text,
                              validatorFunction: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Description must not be empty';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SignupTextField(
                              hintText: 'Enter your phone number',
                              text: 'Phone number',
                              controller: phoneController,
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
                            SignupTextField(
                              hintText: 'Enter no. of bags',
                              text: 'blood bags',
                              controller: bloodBagsController,
                              keyboardtype: TextInputType.phone,
                              validatorFunction: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Blood bags must not be empty';
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //expired date
                            Container(
                                width: double.infinity,
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Expired date',
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
                                        controller: expiredDateController,
                                        keyboardType: TextInputType.datetime,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Expired date must not be empty';
                                          }
                                        },
                                        onTap: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.parse(
                                              expiredDateController.text,
                                            ),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime.parse(
                                                '2025-05-05'),
                                          ).then(
                                                (value) {
                                              expiredDateController.text =
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
                                            borderRadius: BorderRadius.circular(
                                                10),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 1),
                                            borderRadius: BorderRadius.circular(
                                                20),
                                          ),
                                          hintText: 'Enter your birthdate',
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10),
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
                                      value:
                                      governorateItemList[govIdForRequest! - 1]
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
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide: const BorderSide(
                                            color: greyColor,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius: BorderRadius.circular(
                                              20),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
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
                                        print('hi');
                                        int id = governorateItemList.indexWhere(
                                                (element) =>
                                            element.governorateName ==
                                                newValue);
                                        govIdForRequest =
                                            governorateItemList[id].id;
                                        cubit.getCityEditRequestData(
                                            id: govIdForRequest!);
                                        idIndexOfCityEditRequest = 0;
                                        print(id);
                                        print(govIdForRequest);
                                        print(idIndexOfCityEditRequest);
                                        print('hi');
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      value: cubit
                                          .cityEditRequestItemList[
                                      idIndexOfCityEditRequest!]
                                          .cityName,
                                      hint: const Text(
                                        'City',
                                      ),
                                      validator: (value) {
                                        if (value == null) {
                                          return "City must not be empty";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        focusColor: Colors.green,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide: const BorderSide(
                                            color: greyColor,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.red, width: 1),
                                          borderRadius: BorderRadius.circular(
                                              20),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                      ),
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down),
                                      items: cubit.cityEditRequestItemList
                                          .asMap()
                                          .entries
                                          .map((items) {
                                        return DropdownMenuItem(
                                          value: items.value.cityName,
                                          child: Text(items.value.cityName!),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        int id = cubit.cityEditRequestItemList
                                            .indexWhere((element) =>
                                        element.cityName == newValue);
                                        idIndexOfCityEditRequest = id;
                                        cityIdForRequest =
                                        (cubit.cityEditRequestItemList[id].id)!;
                                        // idIndexOfCity = id;
                                        // flag = true;
                                        // print(idIndexOfCity);
                                        // print(cubit.cityEditRequestItemList[idIndexOfCity!].cityName);
                                      },
                                    )
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            //blood group
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
                                  height:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.008,
                                ),
                                DropdownButtonFormField<String>(
                                  value: bloodTypeController.text,
                                  items: cubit.bloodGroupItem
                                      .map((label) =>
                                      DropdownMenuItem(
                                        child: Text(
                                          label,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        value: label,
                                      ))
                                      .toList(),
                                  onChanged: (value) {
                                    bloodTypeController.text = value!;
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
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                  ),
                                  hint: const Text('Blood type'),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Buttons_without_icon(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.updateRequest(
                                    title: titleController.text,
                                    description: descriptionController.text,
                                    phone: phoneController.text,
                                    numberOfBags: bloodBagsController.text,
                                    expiredDate: expiredDateController.text,
                                    bloodType: bloodTypeController.text,
                                    govId: govIdForRequest.toString(),
                                    cityId: cityIdForRequest.toString(),
                                    id: myRequestModel!
                                        .requests![indexOfMyRequest!].id!,
                                  );
                                  print(govIdForRequest);
                                  print(cityIdForRequest);
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
                              height: 25,
                            ),
                          ],
                        ),
                      )),
                ),
            fallback: (context) =>
                Center(
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
