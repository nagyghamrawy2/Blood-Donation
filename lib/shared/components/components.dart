import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Buttons_without_icon extends StatelessWidget {
  Buttons_without_icon({
    required this.num_hieght,
    required this.text_button_name,
    required this.button_color,
    required this.num_border,
    required this.num_fontsize,
    required this.text_fontwwieght,
    this.function,
  });

  late double num_hieght;
  late String text_button_name;
  late Color button_color;
  late double num_border;
  late double num_fontsize;
  late FontWeight text_fontwwieght;
  Function? function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: num_hieght,
      child: ElevatedButton(
        child: Text(text_button_name),
        onPressed: () {
          function!();
        },
        style: ElevatedButton.styleFrom(
            primary: button_color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(num_border)),
            textStyle: TextStyle(
                fontSize: num_fontsize, fontWeight: text_fontwwieght)),
      ),
    );
  }
}

class Textformfield_with_border extends StatelessWidget {
  Textformfield_with_border({
    required this.controllerName,
    required this.keyboardType,
    this.obsecure = false,
    this.isPasswordField = false,
    required this.hintText,
    required this.text_label,
    required this.num_border,
    this.suffixFunction,
  });

  late TextEditingController controllerName;
  late TextInputType keyboardType;
  final bool obsecure;
  final bool isPasswordField;
  late String hintText;
  late String text_label;
  late double num_border;
  Function? suffixFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 66,
      child: TextFormField(
        controller: controllerName,
        keyboardType: keyboardType,
        obscureText: obsecure,
        decoration: InputDecoration(
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: const TextStyle(fontSize: 16),
          labelText: text_label,
          labelStyle: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black,
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black26, width: 3.0),
              borderRadius: BorderRadius.circular(num_border)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26, width: 3.0),
            borderRadius: BorderRadius.circular(num_border),
          ),
          suffixIcon: isPasswordField == false
              ? null
              : IconButton(
            onPressed: () {
              suffixFunction!();
            },
            icon: Icon(
              obsecure == true ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
          ),

        ),
      ),
    );
  }
}

class Textformfield_with_icon extends StatelessWidget {
  Textformfield_with_icon(
      {required this.controller_Name,
      required this.text_name,
      required this.num_width,
      required this.num_height,
      required this.keyboardtype,
      required this.obsecure,
      required this.text_hint,
      required this.img_right_padding,
      required this.img_bottom_padding,
      required this.icon_name,
      required this.img_width,
      required this.img_height});

  late String text_name;
  late double num_width;
  late double num_height;
  late TextInputType keyboardtype;
  late bool obsecure;
  late String text_hint;
  late double img_right_padding;
  late double img_bottom_padding;
  late String icon_name;
  late double img_width;
  late double img_height;
  TextEditingController controller_Name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Text(
                text_name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * num_width,
              height: MediaQuery.of(context).size.height * num_height,
              child: Material(
                elevation: 10.0,
                shadowColor: Colors.white,
                child: TextField(
                  controller: controller_Name,
                  keyboardType: keyboardtype,
                  obscureText: obsecure,
                  decoration: InputDecoration(
                    hintText: text_hint,
                    contentPadding: const EdgeInsets.all(15),
                    hintStyle: const TextStyle(fontSize: 16),
                    border: InputBorder.none,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(
                          right: img_right_padding, bottom: img_bottom_padding),
                      child: Image.asset(
                        icon_name,
                        width: img_width,
                        height: img_height,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Button_with_icon extends StatelessWidget {
  Button_with_icon({
    required this.num_width,
    required this.num_height,
    required this.img_left_padding,
    required this.img_bottom_padding,
    required this.label_name,
    required this.color,
    required this.icon_name,
    required this.img_width,
    required this.img_height,
    required this.fontsize,
    required this.label_color,
    required this.num_border,
    required this.label_fontwieght,
  });

  late double num_width;
  late double num_height;
  late double img_left_padding;
  late double img_bottom_padding;
  late String icon_name;
  late double img_width;
  late double img_height;
  late String label_name;
  late Color color;
  late Function function;
  late double fontsize;
  late FontWeight label_fontwieght;
  late Color label_color;
  late double num_border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function;
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(num_border),
        ),
        width: num_width,
        height: num_height,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: img_left_padding, bottom: img_bottom_padding),
              child: Image.asset(
                icon_name,
                width: img_width,
                height: img_height,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(label_name,
                style: TextStyle(
                    fontSize: fontsize,
                    fontWeight: label_fontwieght,
                    color: label_color)),
          ],
        ),
      ),
    );
  }
}

class Requst_textformfield extends StatelessWidget {
  Requst_textformfield({
    required this.controller_Name,
    required this.text_name,
    required this.num_width,
    required this.num_height,
    required this.keyboardtype,
    required this.obsecure,
    required this.text_hint,
  });

  late String text_name;
  late double num_width;
  late double num_height;
  late TextInputType keyboardtype;
  late bool obsecure;
  late String text_hint;
  TextEditingController controller_Name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            child: Text(
              text_name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * num_width,
            height: MediaQuery.of(context).size.height * num_height,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.white,
              child: TextFormField(
                controller: controller_Name,
                keyboardType: keyboardtype,
                obscureText: obsecure,
                decoration: InputDecoration(
                  hintText: text_hint,
                  hintStyle:
                      const TextStyle(fontSize: 16, color: Color(0xFF808080)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Textformfield_with_border_with_icon2 extends StatelessWidget {
  Textformfield_with_border_with_icon2(
      {required this.controller_Name,
      required this.keyboardtype,
      required this.obsecure,
      required this.text_hint,
      required this.text_label,
      required this.num_border,
      required this.img_right_padding,
      required this.img_bottom_padding,
      required this.icon_name,
      required this.img_width,
      required this.img_height});

  late TextInputType keyboardtype;
  late bool obsecure;
  late String text_hint;
  late String text_label;
  late double num_border;
  late double img_right_padding;
  late double img_bottom_padding;
  late String icon_name;
  late double img_width;
  late double img_height;
  TextEditingController controller_Name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 66,
      child: TextFormField(
        controller: controller_Name,
        keyboardType: keyboardtype,
        obscureText: obsecure,
        decoration: InputDecoration(
          hintText: text_hint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: const TextStyle(fontSize: 16),
          labelText: text_label,
          labelStyle: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black26, width: 3.0),
              borderRadius: BorderRadius.circular(num_border)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26, width: 3.0),
            borderRadius: BorderRadius.circular(num_border),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(
                right: img_right_padding, bottom: img_bottom_padding),
            child: Image.asset(
              icon_name,
              width: img_width,
              height: img_height,
            ),
          ),
        ),
        onChanged: (value) {
          // do something
        },
      ),
    );
  }
}

class SignupTextField extends StatelessWidget {
  SignupTextField({
    this.hintText = '',
    this.secure = false,
    this.isPasswordField=false,
    required this.text,
    required this.controller,
    required this.keyboardtype,
    required this.validatorText,
    this.suffixFunction,
  });

  final bool isPasswordField;
  final String hintText;
  final bool secure;
  late String text;
  late TextEditingController controller;
  late TextInputType keyboardtype;
  late String validatorText;
  Function? suffixFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
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
                obscureText: secure,
                controller: controller,
                keyboardType: keyboardtype,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return validatorText;
                  }
                },
                decoration: InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: greyColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: hintText,
                  suffixIcon: isPasswordField == false
                      ? null
                      : IconButton(
                          onPressed: () {
                            suffixFunction!();
                          },
                          icon: Icon(
                            secure == true ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ));
  }
}

class DropDownCustom extends StatelessWidget {
  String dropdownvalue = 'A+';
  List<String> blood_group_item = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return DropdownButtonFormField(
          decoration: InputDecoration(
            focusColor: Colors.green,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // Initial Value
          value: cubit.dropDownValue,

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),
          items: cubit.blood_group_item.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            print(newValue);
            cubit.ChangeDropDownValue(newValue);
          },
        );
      },
    );
  }
}

class EducationInfo extends StatelessWidget {
  EducationInfo({required this.index});

  late int index;

  @override
  Widget build(BuildContext context) {
    return index % 2 == 0
        ? Card(
            elevation: 10.0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 125,
              decoration: const BoxDecoration(
                color: Color(0xFFFFEEE6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/test.png"),
                      radius: 60,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "The Concept of Red Blood Cell",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.sp,
                                color: const Color(0xFF5D240C)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            "Hellosadfas asdfasdfcs swadsdasdasdasadsadasdasdasdasdsadsadsadasdasdsad asdasdsaddasdasdasdasda",
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF787F8F),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const InkWell(
                            child: Text(
                              "Learn more",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFFFF0000)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // child: Material(
              //   elevation: 10.0,
              //   shadowColor: Colors.white,
              // ),
            ),
          )
        : Card(
            elevation: 10.0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 125,
              decoration: const BoxDecoration(
                color: Color(0xFFF8F8F8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/test.png"),
                      radius: 60,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "The Concept of Red Blood Cell",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.sp,
                                color: const Color(0xFF5D240C)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            "Hellosadfas asdfasdfcs swadsdasdasdasadsadasdasdasdasdsadsadsadasdasdsad asdasdsaddasdasdasdasda",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xFF787F8F)),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const InkWell(
                            child: Text(
                              "Learn more",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFFFF0000)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // child: Material(
              //   elevation: 10.0,
              //   shadowColor: Colors.white,
              // ),
            ),
          );
  }
}

class BloodBankInfo extends StatelessWidget {
  BloodBankInfo(this.imageLink, this.hospitalName, this.governorate, this.city,
      {Key? key})
      : super(key: key);

  late String imageLink;
  late String hospitalName;
  late String governorate;
  late String city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: double.infinity,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageLink),
              radius: 29,
            ),
            const SizedBox(
              width: 11,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hospitalName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '$city,$governorate',
                    style: const TextStyle(
                      color: greyColor2,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/phone-call.svg",
                      color: greenColor,
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(
                      Icons.location_on,
                      color: mainColor,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  ProfileInfo({
    Key? key,
    required this.label,
    required this.leftLabel,
  }) : super(key: key);

  late String label;
  late String leftLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            '$label',
          )),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              '$leftLabel',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  ProfileButton({
    Key? key,
    required this.icon_name,
    required this.img_width,
    required this.img_height,
    required this.label_name,
    this.have_switch = false,
    this.cubitValueSwitch = false,
    required this.function,
    this.switchFun,
  }) : super(key: key);

  late String icon_name;
  late double img_width;
  late double img_height;
  late String label_name;
  final bool have_switch;
  bool cubitValueSwitch;
  Function(bool val)? switchFun;
  late Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          width: double.infinity,
          height: 43,
          color: Colors.black26,
          child: have_switch
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 13,
                      ),
                      child: Image.asset(
                        icon_name,
                        width: img_width,
                        height: img_height,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        label_name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Switch.adaptive(
                      activeColor: Colors.green,
                      inactiveTrackColor: Colors.red,
                      value: cubitValueSwitch,
                      onChanged: (value) {
                        switchFun!(value);
                      },
                    ),
                  ],
                )
              : Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 13,
                      ),
                      child: Image.asset(
                        icon_name,
                        width: img_width,
                        height: img_height,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        label_name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  PasswordTextField({
    this.hintText = '',
    this.secure = false,
    required this.text,
    required this.controller,
    required this.keyboardtype,
    required this.validatorText,
  });

  final String hintText;
  final bool secure;
  late String text;
  late TextEditingController controller;
  late TextInputType keyboardtype;
  late String validatorText;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Container(
              width: double.infinity,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
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
                      obscureText: cubit.obsecure,
                      controller: controller,
                      keyboardType: keyboardtype,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '$validatorText';
                        }
                      },
                      decoration: InputDecoration(
                        focusColor: Colors.green,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: greyColor,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: hintText,
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changePasswordStatus();
                          },
                          icon: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}//never used
class Textformfield2_with_border_with_icon extends StatelessWidget {
  Textformfield2_with_border_with_icon(
      {required this.controller_Name,
        required this.text_name,
        required this.num_width,
        required this.num_height,
        required this.keyboardtype,
        required this.obsecure,
        required this.text_hint,
        required this.img_right_padding,
        required this.img_bottom_padding,
        required this.icon_name,
        required this.img_width,
        required this.img_height});

  late String text_name;
  late double num_width;
  late double num_height;
  late TextInputType keyboardtype;
  late bool obsecure;
  late String text_hint;
  late double img_right_padding;
  late double img_bottom_padding;
  late String icon_name;
  late double img_width;
  late double img_height;
  TextEditingController controller_Name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            child: Text(
              text_name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * num_width,
            height: num_height,
            child: TextField(
              controller: controller_Name,
              keyboardType: keyboardtype,
              obscureText: obsecure,
              decoration: InputDecoration(
                hintText: text_hint,
                contentPadding: const EdgeInsets.all(15),
                hintStyle: const TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.black12, width: 2.0),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.black26, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(
                      right: img_right_padding, bottom: img_bottom_padding),
                  child: Image.asset(
                    icon_name,
                    width: img_width,
                    height: img_height,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
} //never used
