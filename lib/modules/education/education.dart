import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFED394A),
        title: Text(
          "Education",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Articles",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return EducationInfo(index: index);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 19,
                    );
                  },
                  itemCount: 20),
            ),
          ],
        ),
      ),
    );
  }
}
