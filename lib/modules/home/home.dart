import 'package:blood_bank/shared/styles/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pp.png'),
                  radius: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    'Hello Hesham Ahmed ! How are you?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Card(
                elevation: 3,
                child: Container(
                  width: 380,
                  height: 215,
                  child: Image(
                    image: AssetImage('assets/images/homeImage.png'),

                  ),
                ),
              ),
            ),
            DottedLine(
              dashColor: mainColor,
            ),
            Card(
              elevation: 3,
              child: Container(
                width: double.infinity,
                height: 210,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: greyColor2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 3,
                            child: Container(
                              height: 75,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: greyColor2),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/findDonor.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  Text('Find donor'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 5,
                            child: Container(
                              height: 75,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: greyColor2),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/postRequest.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  Text('Post request'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 3,
                            child: Container(
                              height: 75,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: greyColor2),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/edit.png'),
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text('Edit profile'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 3,
                            child: Container(
                              height: 75,
                              width: 125,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: greyColor2),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/requests.png'),
                                    width: 35,
                                    height: 35,
                                  ),
                                  Text('Browse requests'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 3,
                            child: Container(
                              height: 75,
                              width: 125,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: greyColor2),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/bloodBank.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  Text('Browse blood bank'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
