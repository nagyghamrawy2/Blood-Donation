import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Education",
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 42.h,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Articles",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 29.h,
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => EducationInfo(index: index),
                separatorBuilder: (context, index) => SizedBox(
                  height: 29.h,
                ),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
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
