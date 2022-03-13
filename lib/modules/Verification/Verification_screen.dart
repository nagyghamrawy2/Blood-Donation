import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(237, 57, 74, 1),
          title: Text('Verification'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Transform.rotate(
                    angle: -math.pi / 7,
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/verify.png'),
                          fit: BoxFit.fill,
                        ),
                        //  shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'OTP VERIFICATION',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Enter verification code sent your Email Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromRGBO(120, 127, 143, 1),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 17,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey)),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey)),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey)),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey)),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Buttons_without_icon(
                num_width: 0.9,
                num_hieght: 52,
                text_button_name: 'Verifiy',
                button_color: Color.fromRGBO(237, 57, 74, 1),
                num_border: 11,
                num_fontsize: 20,
                text_fontwwieght: FontWeight.normal)
          ],
        ));
  }
}
