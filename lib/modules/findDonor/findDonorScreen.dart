import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset("assets/images/finddonor.jpg"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => FindDonorInfo("assets/images/pp.png", "Hesham ahmed", "helwan", "cairo",'A+'),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 30.h,
                      ),
                  itemCount: 20,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isButtomSheetShown) {
            Navigator.pop(context);
            isButtomSheetShown = false;
          } else {
            scaffoldkey.currentState?.showBottomSheet((context) => Container(
                  height: 420.h,
                  color: greyColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Blood type",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.sp,
                              color: mainColor,
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
                          height: 6.h,
                        ),
                        Text(
                          "Governorate",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                            fontSize: 28.sp,
                              color: mainColor,
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
                          height: 6.h,
                        ),
                        Text(
                          "City",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.sp,
                              color: mainColor,
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
    );
  }
}
