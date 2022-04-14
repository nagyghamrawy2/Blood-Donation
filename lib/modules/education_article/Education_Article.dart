import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationArticlesScreen extends StatelessWidget {
  const EducationArticlesScreen({Key? key}) : super(key: key);

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
            Image.asset(
              "assets/images/test.png",
            ),
            SizedBox(
              height: 25.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "The Concept Of Red Blood Cells",
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
                        "Helloasdasdasdsadasdasdsssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                            "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                            "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                            "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                            "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                            "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                            "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                            "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss nagy",
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
