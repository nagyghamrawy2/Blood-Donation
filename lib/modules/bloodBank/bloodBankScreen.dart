import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => BloodBankInfo('assets/images/pp.png', 'Ain shams university hospital', 'cairo', 'maadi'),
                separatorBuilder: (context,index)=> const SizedBox(height: 15,),
                itemCount: 8,
            ),
          ],
        ),
      ),
    );
  }
}
