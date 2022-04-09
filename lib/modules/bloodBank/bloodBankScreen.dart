import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/styles/colors.dart';

class BloodBankScreen extends StatelessWidget {
  const BloodBankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 57, 74, 1),
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
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/pp.png"),
                        radius: 29,
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ain Shams University Hospital",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Helwan,Cairo',
                              style: TextStyle(
                                color: greyColor2,
                              ),
                            ),
                            Text(
                              '30 Km',
                              style: TextStyle(
                                color: greyColor2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/images/phone-call.svg",
                              color: greenColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.location_on,
                              color: mainColor,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) =>
                const SizedBox(
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
