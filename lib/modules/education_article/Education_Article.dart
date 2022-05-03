import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationArticlesScreen extends StatelessWidget {
  late String image;
  late String title;
  late String description;
  EducationArticlesScreen({required this.description ,required this.title , required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Article",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              image,
            ),
            SizedBox(
              height: 25.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5D240C)),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: ListView(
                children: [
                  Card(
                    elevation: 10.0,
                    shadowColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 11, right: 10, bottom: 28, top: 7),
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: Color(0xFF5D240C),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
