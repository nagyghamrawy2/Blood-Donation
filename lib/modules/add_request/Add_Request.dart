import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Add_Request extends StatefulWidget {
  @override
  State<Add_Request> createState() => _Add_RequestState();
}

class _Add_RequestState extends State<Add_Request> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController bagsController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController expired_dateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFED394A),
        title: Text(
          "Request for blood",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              children: [
                Requst_textformfield(
                    controller_Name: titleController,
                    text_name: "Title",
                    num_width: 0.9,
                    num_height: 0.08,
                    keyboardtype: TextInputType.name,
                    obsecure: false,
                    text_hint: "Enter your title "),
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
                    text_hint: "Enter your description "),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.019,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose blood group",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Card(
                      elevation: 10.0,
                      child: Container(
                        height: 125,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cubit.blood_group_item.length,
                          padding: EdgeInsets.fromLTRB(13, 10, 9 , 5),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 52,
                              childAspectRatio: 35 / 41,
                              mainAxisSpacing: 8),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                cubit.changeBloodValue(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  border: Border.all(color: Colors.black),
                                  color:
                                  cubit.bloodGroup == index ? Colors.red : Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    cubit.blood_group_item[index],
                                    style: TextStyle(
                                        color: cubit.bloodGroup == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
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
                    num_height: 0.065,
                    keyboardtype: TextInputType.number,
                    obsecure: false,
                    text_hint: "Enter number of bags",
                    img_right_padding: 15.w,
                    img_bottom_padding: 5.h,
                    icon_name: "assets/images/blood-bag.png",
                    img_width: 10.w,
                    img_height: 10.h),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.0097,
                ),
                Textformfield_with_icon(
                    controller_Name: bagsController,
                    text_name: "Phone Number",
                    num_width: 0.9,
                    num_height: 0.065,
                    keyboardtype: TextInputType.number,
                    obsecure: false,
                    text_hint: "Enter your phone",
                    img_right_padding: 15.w,
                    img_bottom_padding: 5.h,
                    icon_name: "assets/images/blood-bag.png",
                    img_width: 10.w,
                    img_height: 10.h),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.0097,
                ),
                Textformfield_with_icon(
                    controller_Name: bagsController,
                    text_name: "Location",
                    num_width: 0.9,
                    num_height: 0.065,
                    keyboardtype: TextInputType.name,
                    obsecure: false,
                    text_hint: "Enter your location",
                    img_right_padding: 20.w,
                    img_bottom_padding: 5.h,
                    icon_name: "assets/images/location.png",
                    img_width: 10.w,
                    img_height: 10.h),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.0097,
                ),
                Textformfield_with_icon(
                  controller_Name: bagsController,
                  text_name: "Expired Date",
                  num_width: 0.9,
                  num_height: 0.065,
                  keyboardtype: TextInputType.datetime,
                  obsecure: false,
                  text_hint: "Enter date",
                  img_right_padding: 15.w,
                  img_bottom_padding: 5.h,
                  icon_name: "assets/images/blood-bag.png",
                  img_width: 10.w,
                  img_height: 10.h,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Buttons_without_icon(
                    num_width: 3,
                    num_hieght: MediaQuery.of(context).size.height * 0.07,
                    text_button_name: "Post a request",
                    button_color: Color(0xffED394A),
                    num_border: 12.r,
                    num_fontsize: 20.sp,
                    text_fontwwieght: FontWeight.normal),
              ],
            );
          },
        ),
      ),
    );
  }
}
