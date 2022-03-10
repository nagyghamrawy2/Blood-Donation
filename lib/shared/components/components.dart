import 'package:flutter/material.dart';

class Buttons_without_icon extends StatelessWidget {
  Buttons_without_icon(
      {required this.num_width,
      required this.num_hieght,
      required this.text_button_name,
      required this.button_color,
      required this.num_border,
      required this.num_fontsize,
      required this.text_fontwwieght});

  late double num_width;
  late double num_hieght;
  late String text_button_name;
  late Color button_color;
  late double num_border;
  late double num_fontsize;
  late FontWeight text_fontwwieght;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * num_width,
      height: num_hieght,
      child: ElevatedButton(
        child: Text(text_button_name),
        onPressed: () {},
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
    required this.controller_Name,
    required this.keyboardtype,
    required this.obsecure,
    required this.text_hint,
    required this.text_label,
    required this.num_border,
  });

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
          hintStyle: TextStyle(fontSize: 16),
          labelText: text_label,
          labelStyle: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26, width: 3.0),
              borderRadius: BorderRadius.circular(num_border)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26, width: 3.0),
            borderRadius: BorderRadius.circular(num_border),
          ),
          // suffixIcon: Padding(
          //   padding:  EdgeInsets.only(right: img_right_padding ,bottom: img_bottom_padding),
          //   child: Image.asset(icon_name
          //     ,width: img_width,
          //     height: img_height,
          //   ),
          // ),
        ),
        onChanged: (value) {
          // do something
        },
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
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            child: Text(
              text_name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * num_width,
            height: num_height,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.white,
              child: TextField(
                controller: controller_Name,
                keyboardType: keyboardtype,
                obscureText: obsecure,
                decoration: InputDecoration(
                  hintText: text_hint,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(fontSize: 16),
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
    );
  }
}

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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
        ),
        SizedBox(
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
                contentPadding: EdgeInsets.all(15),
                hintStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 2.0),
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
}

class Container_with_button extends StatelessWidget {
  Container_with_button(
      {
        required this.num_width,
        required this.img_left_padding,
        required this.icon_name,
        required this.img_width,
        required this.img_height,
        required this.label_name,
        this.have_switch = false,
        this.cubitValueSwitch = false,
        this.function,
      });
  late double num_width;
  late double img_left_padding;
  late String icon_name;
  late double img_width;
  late double img_height;
  late String label_name;
  final bool have_switch;
  final bool cubitValueSwitch;
  final Function(bool)? function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          width: MediaQuery.of(context).size.width * num_width,
          height: 43,
          color: Colors.black26,
          child: have_switch ? Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: img_left_padding,
                ),
                child: Image.asset(
                  icon_name,
                  width: img_width,
                  height: img_height,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(label_name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Switch.adaptive(
                activeColor: Colors.green,
                inactiveTrackColor: Colors.red,
                value: cubitValueSwitch,
                onChanged: (value){
                  function!(value);
                  print(value);
                },
              ),
            ],
          ) : Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: img_left_padding,
                ),
                child: Image.asset(
                  icon_name,
                  width: img_width,
                  height: img_height,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(label_name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),

            ],
          )
        ),
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Function;
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        width: MediaQuery.of(context).size.width * num_width,
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
            SizedBox(
              width: 5,
            ),
            Text(label_name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class Requst_textformfield extends StatelessWidget {
  Requst_textformfield(
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: MediaQuery.of(context).size.width * num_width,
            height: num_height,
            child: Material(
              elevation: 10.0,
              shadowColor: Colors.white,
              child: TextField(
                controller: controller_Name,
                keyboardType: keyboardtype,
                obscureText: obsecure,
                decoration: InputDecoration(
                  hintText: text_hint,
                  contentPadding: EdgeInsets.all(15),
                  hintStyle: TextStyle(fontSize: 16),
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
          hintStyle: TextStyle(fontSize: 16),
          labelText: text_label,
          labelStyle: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26, width: 3.0),
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
