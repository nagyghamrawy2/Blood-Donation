import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class Find_donor extends StatefulWidget {
  @override
  State<Find_donor> createState() => _Find_donorState();
}

class _Find_donorState extends State<Find_donor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 57, 74, 1),
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
              child: Image.asset(
                "assets/images/finddonor.jpg",
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/pp.png"),
                  radius: 40,
                ),
                SizedBox(
                  width: 11,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Mustafa magdy ",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("helwan,cairo",
                          style:
                              TextStyle(fontSize: 12, color: Colors.black26)),
                      Text("30 km",
                          style: TextStyle(fontSize: 12, color: Colors.black26))
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Buttons_without_icon(
                        num_width: 0.25,
                        num_hieght: 22,
                        text_button_name: "Ask for help",
                        button_color: Color.fromRGBO(237, 57, 74, 1.0),
                        num_border: 9,
                        num_fontsize: 13,
                        text_fontwwieght: FontWeight.normal),
                    Container(
                      height: 21,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(26)),
                      child: Center(
                          child: Text(
                        "A+",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            bottomSheets(context);
          },
          backgroundColor: Color.fromRGBO(237, 57, 74, 1.0),
          child: const Icon(Icons.navigation),
        ),
      ),
    );
  }
}

var bloodtype;

void bottomSheets(context) {
  showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            height: 206,
            decoration:
                BoxDecoration(color: Color.fromRGBO(182, 182, 182, 0.45)),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 293,
                    child: Text(
                      "Blood type",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromRGBO(237, 57, 74, 1.0)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 50,
                  width: 293,
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
                    items: ["A+", "B+", ""]
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
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 293,
                    child: Text(
                      "Location",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromRGBO(237, 57, 74, 1.0)),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 50,
                  width: 293,
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.location_on),
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
                  ),
                )
              ],
            ),
          ));
}
