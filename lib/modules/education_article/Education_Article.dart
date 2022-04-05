import 'package:flutter/material.dart';

class EducationArticlesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFED394A),
        title: Text(
          "",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 29, right: 29),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 206,
              child: Image.asset(
                "assets/images/test.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "The Concept Of Red Blood Cells",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5D240C)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  Card(
                    elevation: 10.0,
                    shadowColor: Colors.white,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 11, right: 10, bottom: 28, top: 7),
                        child: Text(
                          "Helloasdasdasdsadasdasdsssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                              "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                              "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                              "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                              "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                              "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                              "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
                              "Helloasdasdasdsadasdasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssasdsadasdsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss nagy",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF5D240C),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
