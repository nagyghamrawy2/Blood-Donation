import 'package:blood_bank/layout/home_layout.dart';
import 'package:blood_bank/modules/request/requestScreen.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AddRequestScreen extends StatefulWidget {
  @override
  State<AddRequestScreen> createState() => _AddRequestScreenState();
}

class _AddRequestScreenState extends State<AddRequestScreen> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController hospitalNameController = new TextEditingController();
  TextEditingController hospitalAddressController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController bagsController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController expired_dateController = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  int? id;

  @override
  void initState() {
    AppCubit.get(context).bloodGroup = -1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSuccessPostRequestsDataState) {
          AppCubit.get(context).getMyRequests();
          AppCubit.get(context).getAllRequests();
          print('state before pop');
          Navigator.pop(context);
          print('state after pop');

        }
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFED394A),
            title: const Text(
              "Request for blood",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            actions: const [
              Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Requst_textformfield(
                      controller_Name: titleController,
                      text_name: "Title",
                      num_width: 0.9,
                      num_height: 0.08,
                      keyboardtype: TextInputType.name,
                      obsecure: false,
                      text_hint: "Enter your title ",
                      validatorFunction: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter title';
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.009,
                    ),
                    Requst_textformfield(
                      controller_Name: descriptionController,
                      text_name: "Description",
                      num_width: 0.9,
                      num_height: 0.15,
                      keyboardtype: TextInputType.name,
                      obsecure: false,
                      text_hint: "Enter your description ",
                      validatorFunction: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                      },

                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.009,
                    ),
                    Requst_textformfield(
                      controller_Name: hospitalNameController,
                      text_name: "Hospital Name",
                      num_width: 0.9,
                      num_height: 0.15,
                      keyboardtype: TextInputType.name,
                      obsecure: false,
                      text_hint: "Enter hospital name",
                      validatorFunction: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter hospital name';
                        }
                      },

                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.009,
                    ),
                    Requst_textformfield(
                      controller_Name: hospitalAddressController,
                      text_name: "Hospital Address",
                      num_width: 0.9,
                      num_height: 0.15,
                      keyboardtype: TextInputType.name,
                      obsecure: false,
                      text_hint: "Enter hospital address",
                      validatorFunction: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter hospital address';
                        }
                      },

                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.019,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Choose blood group",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Card(
                          elevation: 10.0,
                          child: Container(
                            height:
                                MediaQuery.of(context).size.height * 0.154,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cubit.bloodGroupItem.length,
                              padding:
                                  const EdgeInsets.fromLTRB(13, 10, 9, 5),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: MediaQuery.of(context)
                                              .size
                                              .height *
                                          0.059,
                                      childAspectRatio:
                                          (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  0.65) /
                                              (MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.2),
                                      mainAxisSpacing: 10),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    cubit.changeBloodValue(index);
                                    print(cubit.bloodGroupItem[index]);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15.r),
                                      border: Border.all(color: Colors.black),
                                      color: cubit.bloodGroup == index
                                          ? Colors.red
                                          : Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        cubit.bloodGroupItem[index],
                                        style: TextStyle(
                                            color: cubit.bloodGroup == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 27.sp),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        (cubit.bloodCheck != true)
                            ? Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Blood type must not be empty",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18.sp),
                                ))
                            : Text(""),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.009,
                    ),
                    Textformfield_with_icon(
                      controller_Name: bagsController,
                      text_name: "Blood Bags",
                      num_width: 0.9,
                      num_height: 80.h,
                      keyboardtype: TextInputType.number,
                      obsecure: false,
                      text_hint: "Enter number of bags",
                      img_right_padding: 15.w,
                      img_bottom_padding: 5.h,
                      icon_name: "assets/images/blood-bag.png",
                      img_width: 10.w,
                      img_height: 10.h,
                      validatorFunction: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter number of bags';
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0097,
                    ),
                    Textformfield_with_icon(
                      controller_Name: phoneController,
                      text_name: "Phone Number",
                      num_width: 0.9,
                      num_height: 80.h,
                      keyboardtype: TextInputType.number,
                      obsecure: false,
                      text_hint: "Enter your phone",
                      img_right_padding: 15.w,
                      img_bottom_padding: 5.h,
                      icon_name: "assets/images/blood-bag.png",
                      img_width: 10.w,
                      img_height: 10.h,
                      validatorFunction: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if(value.length != 11){
                          return "Please enter valid phone";
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0097,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Governorate",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Card(
                      elevation: 5.0,
                      child:  DropdownButtonFormField(
                        hint: const Text(
                          'Governorate',
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Governorate must not be empty";
                          }
                        },
                        decoration: const InputDecoration(
                         border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: governorateItemList.asMap().entries.map((items) {
                          return DropdownMenuItem(
                            value: items.value.governorateName,
                            child: Text(items.value.governorateName!),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          id = governorateItemList.indexWhere((element) => element.governorateName == newValue);
                          govRequestId = governorateItemList[id!].id;
                          cubit.getCityRequestData(id: govRequestId!);
                          print(id);
                          print(govRequestId);
                          print(cubit.cityRequestItemList);
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "City",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    ConditionalBuilder(
                      condition: cubit.cityRequestItemList.isNotEmpty,
                      builder: (context) => Card(
                        elevation: 5.0,
                        child: DropdownButtonFormField(
                            hint: const Text(
                              'City',
                            ),
                            validator: (value) {
                              if (value == null) {
                                return "City must not be empty";
                              }
                            },
                            decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                            ),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: cubit.cityRequestItemList
                                .asMap()
                                .entries
                                .map((items) {
                              return DropdownMenuItem(
                                value: items.value.cityName,
                                child: Text(items.value.cityName!),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              int id = cubit.cityRequestItemList.indexWhere(
                                      (element) => element.cityName == newValue);
                              cityRequestId = cubit.cityRequestItemList[id].id;
                            }),
                      ),
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0097,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: Text(
                                "Expired Date",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 80.h,
                              child: Material(
                                elevation: 10.0,
                                shadowColor: Colors.white,
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2023-01-01'),
                                    ).then((value) {
                                      expired_dateController.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                  controller: expired_dateController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Date must not be empty';
                                    } else {
                                      expired_dateController.text = value;
                                    }
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(15),
                                    hintText: "Enter expired date",
                                    hintStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF808080)),
                                    border: InputBorder.none,
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          right: 20.w, bottom: 5.h),
                                      child: Image.asset(
                                        "assets/images/blood-bag.png",
                                        width: 10.w,
                                        height: 10.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    ConditionalBuilder(
                        condition: state is! AppLoadingPostRequestsDataState,
                        builder: (context) => Buttons_without_icon(
                          num_hieght: MediaQuery.of(context).size.height * 0.07,
                          text_button_name: "Post a request",
                          button_color: const Color(0xffED394A),
                          num_border: 12.r,
                          num_fontsize: 25.sp,
                          text_fontwwieght: FontWeight.normal,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              // cubit.changeBloodCheck();

                              cubit.postRequest(
                                title: titleController.text,
                                description: descriptionController.text,
                                phone: phoneController.text,
                                numberOfBags: bagsController.text,
                                expiredDate: expired_dateController.text,
                                bloodType: cubit.bloodGroupItem[cubit.bloodGroup],
                                govId: govRequestId.toString(),
                                cityId: cityRequestId.toString(),
                                hospitalAddress: hospitalAddressController.text,
                                hospitalName: hospitalNameController.text,
                              );
                              // Navigator.pop(context);
                              print('done');
                            } else {
                              cubit.changeBloodCheck();
                              print('not done');
                            }
                          },
                        ),
                        fallback: (context) => Center(child: CircularProgressIndicator(color: mainColor,),)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
