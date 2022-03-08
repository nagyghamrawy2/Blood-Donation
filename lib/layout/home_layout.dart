import 'package:blood_bank/modules/home/home.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        child: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 62.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: (){},
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/images/home.png'),
                              height: 31,
                              width: 32,
                            ),
                            const Text('Home'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: (){},
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/images/requests.png'),
                              height: 31,
                              width: 32,
                            ),
                            Text('Requests'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: (){},
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/images/education.png'),
                              height: 31,
                              width: 32,
                            ),
                            Text('Education'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: (){},
                        child: Column(
                          children: [
                            const Image(
                              image: AssetImage('assets/images/profile.png'),
                              height: 31,
                              width: 32,
                            ),
                            Text('Profile'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
