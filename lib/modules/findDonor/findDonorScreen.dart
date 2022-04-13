import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';

class FindDonorScreen extends StatelessWidget {
  @override
  var bloodtype;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  bool isButtomSheetShown = false;

  FindDonorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text('Find a donor'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 285.33,
              child: Image.asset("assets/images/finddonor.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                        height: 110,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/pp.png",
                              ),
                              radius: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Hesham ahmed',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Helwan,Cairo',
                                    style: TextStyle(
                                      color: greyColor2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 28,
                                    width: 85,
                                    child: Center(
                                      child: Text(
                                        'Ask for help',
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: mainColor,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 21,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius:
                                            BorderRadius.circular(26)),
                                    child: Center(
                                        child: Text(
                                      "A+",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 3,
                      ),
                  itemCount: 20,),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            if (isButtomSheetShown) {
              Navigator.pop(context);
              isButtomSheetShown = false;
            } else {
              scaffoldkey.currentState?.showBottomSheet((context) => Container(
                    height: 275,
                    color: greyColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 50),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,//eh lzmtha ??
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                "Blood type",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: mainColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: 60,
                            width: double.infinity,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              items: [
                                "A+",
                                "B+",
                                "A-",
                                "B-",
                                "AB+",
                                "AB-",
                                "O+",
                                "O-"
                              ]
                                  .map((label) => DropdownMenuItem(
                                        child: Text(
                                          label,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        value: label,
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                bloodtype = value.toString();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                "Governorate",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: mainColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: 60,
                            width: double.infinity,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              items: ["Cairo", "Alex", "Tanta", "helwan"]
                                  .map((label) => DropdownMenuItem(
                                        child: Text(
                                          label,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        value: label,
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                bloodtype = value.toString();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                "City",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: mainColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            height: 60,
                            width: double.infinity,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              items: ["15 mayo", "ma3sara", "masaken"]
                                  .map((label) => DropdownMenuItem(
                                        child: Text(
                                          label,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        value: label,
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                bloodtype = value.toString();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
              isButtomSheetShown = true;
            }
          },
          backgroundColor: mainColor,
          child: const Icon(Icons.filter_alt_outlined),
        ),
      ),
    );
  }
}
