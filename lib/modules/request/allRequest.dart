import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 20,
              child: Text(
                'A+',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: mainColor,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hesham ahmed needs blood',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'no of bags    2',
                    style: TextStyle(
                      color: greyColor2,
                    ),
                  ),
                  Text(
                    'Date      Dec,6,2022',
                    style: TextStyle(
                      color: greyColor2,
                    ),
                  ),
                  Text(
                    'Location    Cairo,helwan',
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
                  child: Container(
                    height: 28,
                    width: 85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Contact',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          radius: 13,
                          child: Image.asset(
                            'assets/images/chat.png',
                          ),
                          backgroundColor: greenColor,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: greenColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 28,
                    width: 85,
                    color: mainColor,
                    child: Center(
                      child: Text(
                        'I can donate',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
