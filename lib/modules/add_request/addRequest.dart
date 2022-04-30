import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AddRequestScreen extends StatelessWidget {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController bagsController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController expired_dateController = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  AddRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
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
              actions: [
                const Icon(
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
                        validatorText: 'Please enter title',),
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
                        validatorText: 'Please enter description',),
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
                              height: MediaQuery.of(context).size.height * 0.154,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: cubit.bloodGroupItem.length,
                                padding: const EdgeInsets.fromLTRB(13, 10, 9, 5),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing:
                                            MediaQuery.of(context).size.height *
                                                0.059,
                                        childAspectRatio: (MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                0.65) /
                                            (MediaQuery.of(context).size.height /
                                                1.2),
                                        mainAxisSpacing: 10),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      cubit.changeBloodValue(index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.r),
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
                        validatorText: 'Please enter number of bags',
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
                        validatorText: 'Please enter phone number',),
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
                      //LocationGovernorateCustom(border: false,),
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
                     // LocationCityCustom(border: false),
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
                                      fontWeight: FontWeight.bold, fontSize: 18),
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
                                height:
                                    80.h,
                                child: Material(
                                  elevation: 10.0,
                                  shadowColor: Colors.white,
                                  child: TextFormField(
                                    readOnly: true,
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.parse('2025-05-05'),
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
                                      hintText: "Enter expired date",
                                      hintStyle: const TextStyle(
                                          fontSize: 16, color: Color(0xFF808080)),
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
                      Buttons_without_icon(
                        num_hieght: MediaQuery.of(context).size.height * 0.07,
                        text_button_name: "Post a request",
                        button_color: const Color(0xffED394A),
                        num_border: 12.r,
                        num_fontsize: 25.sp,
                        text_fontwwieght: FontWeight.normal,
                        function: () {
                          // if (formKey.currentState!.validate() &&
                          //     (cubit.policyTerms)) {
                          //   cubit.ChangeCheck();
                          //   print('done');
                          // } else {
                          //   cubit.ChangeCheck();
                          //   print('not done');
                          // }
                        },
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
