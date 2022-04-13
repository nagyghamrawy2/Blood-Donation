import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';

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
