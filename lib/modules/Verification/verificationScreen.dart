import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../shared/styles/colors.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Verification'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Transform.rotate(
              angle: -math.pi / 7,
              child: Container(
                height: 120.0,
                width: 120.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/verify.png'),
                    fit: BoxFit.fill,
                  ),
                  //  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
                alignment: Alignment.center,
                child: Text(
                  'OTP VERIFICATION',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )),
            const Align(
                alignment: Alignment.center,
                child: Text(
                  'Enter verification code sent your Email Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: greyColor2,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 17,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey)),
                  child: const TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey)),
                  child: const TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey)),
                  child: const TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey)),
                  child: const TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Buttons_without_icon(
                  num_hieght: 52,
                  text_button_name: 'Verifiy',
                  button_color: const Color.fromRGBO(237, 57, 74, 1),
                  num_border: 11,
                  num_fontsize: 20,
                  text_fontwwieght: FontWeight.normal),
            )
          ],
        ));
  }
}
