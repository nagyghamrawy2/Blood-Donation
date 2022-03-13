import 'package:flutter/material.dart';

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
            CircleAvatar(maxRadius: 25,child: Image.asset(""),),
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
      body: Container(),
    );
  }
}
