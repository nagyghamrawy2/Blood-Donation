import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class chat extends StatefulWidget {
  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 57, 74, 1),
        title: Container(
            child: Row(
             children: [
             CircleAvatar(
              backgroundImage: AssetImage("assets/images/pp.png"),
              radius: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text('HESHAM AHMED')
          ],
        )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.call, color: Colors.black, size: 40)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.close_outlined,
                color: Colors.black,
                size: 40,
              )),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => Text("Kosom el chat"),
            itemCount: 100,
          )),
          Container(
            margin: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: greyColor,
                    ),
                    height: 55,
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(48),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(48),
                          ),
                          hintText: "Write a reply...",
                          hintStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 18),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: InkWell(
                    child: Icon(
                      Icons.send,
                      size: 40,
                      color: mainColor,
                    ),
                    onLongPress: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
