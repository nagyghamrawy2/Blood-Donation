import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Requests'),
          bottom: const TabBar(
            indicatorColor: mainColor,
            tabs: <Widget>[
              Tab(
                child: Text('All requests'),
              ),
              Tab(
                child: Text('My requests'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                itemBuilder: (context, index) => Container(
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
                      const SizedBox(
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
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(greenColor),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Contact ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.chat,size: 20,),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                            ),
                            onPressed: () {},
                            child: Text(
                              'I can donate',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                itemCount: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                itemBuilder: (context, index) => Container(
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (contex, index) => SizedBox(
                  height: 5,
                ),
                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
