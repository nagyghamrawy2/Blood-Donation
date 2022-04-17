import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/styles/colors.dart';

class BloodBankScreen extends StatelessWidget {
  const BloodBankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood bank'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 301.55,
              child: Image.asset(
                "assets/images/hospital.jpg",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => BloodBankInfo('assets/images/pp.png', 'Ain shams university hospital', 'cairo', 'helwan'),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
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
            SizedBox(
              width: 12.h,
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
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '$city,$governorate',
                    style: TextStyle(
                      color: greyColor2,
                      fontSize: 20.sp,
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
