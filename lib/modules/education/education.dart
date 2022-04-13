import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';

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
        padding:  const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Articles",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => EducationInfo(index: index),
                  separatorBuilder: (context, index) => const SizedBox(height: 19,),
                  itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
