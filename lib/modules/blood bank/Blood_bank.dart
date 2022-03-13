import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/styles/colors.dart';

class Blood_bank extends StatefulWidget {
  @override
  State<Blood_bank> createState() => _Blood_bankState();
}

class _Blood_bankState extends State<Blood_bank> {
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
                "assets/images/finddonor.jpg",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: double.infinity,
                height: 80,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CircleAvatar(
                   backgroundImage: AssetImage("assets/images/pp.png"),
                    radius: 28.5,
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Ain Shams University Hospital ",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("helwan,cairo",
                            style:
                            TextStyle(fontSize: 12, color: Colors.black26)),
                        SizedBox(
                          height: 3,
                        ),
                        Text("30 km",
                            style: TextStyle(fontSize: 12, color: Colors.black26))
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 13,
                          child: SvgPicture.asset("assets/images/phone-call.svg",color: greenColor,),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 28,
                          width: 85,
                          child: Center(
                            child: Icon(Icons.location_on,color: mainColor,size: 30,),
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            ),
          ],
        ),
      ),

    );
  }
}




