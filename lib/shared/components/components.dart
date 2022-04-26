import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    this.onFieldSubmitted,
    required this.validatorText,
    required this.haveIcon,
    this.iconName,
  });

  late TextEditingController controllerName;
  late TextInputType keyboardType;
  final bool obsecure;
  final bool isPasswordField;
  late String hintText;
  late String text_label;
  late double num_border;
  late String validatorText;
  Function? suffixFunction;
  Function? onFieldSubmitted;

  late bool haveIcon;
  String? iconName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerName,
      keyboardType: keyboardType,
      obscureText: obsecure,
      onFieldSubmitted:(value)
      {
        onFieldSubmitted!(value);
      }
      ,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: const TextStyle(fontSize: 16),
        labelText: text_label,
        labelStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26, width: 3.0),
            borderRadius: BorderRadius.circular(num_border),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black26, width: 3.0),
          borderRadius: BorderRadius.circular(num_border),
        ),
        suffixIcon: (haveIcon == true)
            ? (isPasswordField == true
                ? IconButton(
                    onPressed: () {
                      suffixFunction!();
                    },
                    icon: Icon(
                      obsecure == true ? Icons.lock : Icons.lock_open,
                      color: Colors.deepOrange,
                      size: 50.h,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 4),
                    child: Image.asset(
                      iconName!,
                      width: 10,
                      height: 15,
                    ),
                  ))
            : null,
      ),
    );
  }
}
void ShowToast({
  required String text,
  required ToastStates state,
}){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: ChooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastStates{SUCCESS,ERROR,WARING}

Color ChooseToastColor(ToastStates state){
  Color color;

  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARING:
      color = Colors.yellow;
      break;
  }
  return color;
}
void navigateAndFinish(context,widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route) {
    return false;
  },
);

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
      required this.img_height,
      required this.validatorText,
      });

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
  late String validatorText;

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
                     TextStyle(fontWeight: FontWeight.bold, fontSize: 26.sp),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Card(
              elevation: 5.0,
              shadowColor: Colors.white,
              child: TextFormField(
                controller: controller_Name,
                keyboardType: keyboardtype,
                obscureText: obsecure,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return validatorText;
                  }
                },
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
    required this.validatorText,
  });

  late String text_name;
  late double num_width;
  late double num_height;
  late TextInputType keyboardtype;
  late bool obsecure;
  late String text_hint;
  TextEditingController controller_Name;
  late String validatorText;

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
          child: Card(
            elevation: 5.0,
            shadowColor: Colors.white,
            child: TextFormField(
              controller: controller_Name,
              keyboardType: keyboardtype,
              obscureText: obsecure,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return validatorText;
                }
              },
              decoration: InputDecoration(

                contentPadding: const EdgeInsets.all(15),
                hintText: text_hint,
                hintStyle:
                    const TextStyle(fontSize: 16, color: Color(0xFF808080) ,),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignupTextField extends StatelessWidget {
  SignupTextField({
    this.hintText = '',
    this.secure = false,
    this.isPasswordField = false,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27.sp,
          ),
        ),
         SizedBox(
          height: MediaQuery.of(context).size.height * 0.008,
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 0,
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
                        secure == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownCustom extends StatelessWidget {

  DropDownCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return DropdownButtonFormField(
          value: cubit.dropDownValue,
          hint: Text(
            'Blood Type',
          ),
          validator: (String? value) {
            if (value == null) {
              return "Please select your blood type";
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
          ),
          // Initial Value


          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),
          items: cubit.drop_down_blood_group_item.map((String items) {
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

class LocationGovernorateCustom extends StatelessWidget {
  LocationGovernorateCustom({required this.border});
  late bool border;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return(border == true)? DropdownButtonFormField(
          value: cubit.locationcityvalue,
          hint: Text(
            'Governorate',
          ),
          validator: (String? value) {
            if (value == null) {
              return "Please choose your governorate";
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
          ),
          // Initial Value

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),
          items: cubit.location__item.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            print(newValue);
            cubit.ChangeLocationCityValue(newValue);
          },
        ):
        Card(
          elevation: 5.0,
          child: DropdownButtonFormField(
            value: cubit.locationcityvalue,
            hint: Text(
              'Governorate',
            ),
            validator: (String? value) {
              if (value == null) {
                return "Please choose your governorate";
              }
            },
            decoration:InputDecoration(
              border: InputBorder.none,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // Initial Value

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),
            items: cubit.location__item.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              print(newValue);
              cubit.ChangeLocationCityValue(newValue);
            },
          ),
        );
      },
    );
  }
}

class LocationCityCustom extends StatelessWidget {
  LocationCityCustom({required this.border});
  late bool border;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return (border == true)?DropdownButtonFormField(
          value: cubit.locationcityvalue,
          hint: Text(
            'City',
          ),
          validator: (String? value) {
            if (value == null) {
              return "Please choose your city";
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
          ),
          // Initial Value


          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),
          items: cubit.location__item.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: (String? newValue) {
            print(newValue);
            cubit.ChangeLocationCityValue(newValue);
          },
        ):
        Card(
          elevation: 5.0,
          child: DropdownButtonFormField(
            value: cubit.locationcityvalue,
            hint: Text(
              'City',
            ),
            validator: (String? value) {
              if (value == null) {
                return "Please choose your city";
              }
            },
            decoration:  InputDecoration(
              border: InputBorder.none,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // Initial Value


            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),
            items: cubit.location__item.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              print(newValue);
              cubit.ChangeLocationCityValue(newValue);
            },
          ),
        );
      },
    );
  }
}

