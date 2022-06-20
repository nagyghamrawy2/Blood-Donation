import 'dart:typed_data';

import 'package:blood_bank/modules/education_article/Education_Article.dart';
import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Education",
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 42.h,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Articles",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 29.h,
            ),
            BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {},
              builder: (context, state) {
                AppCubit cubit = AppCubit.get(context);
                return Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        EducationInfo(index: index),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 29.h,
                        ),
                    itemCount: cubit.educationItemData.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EducationInfo extends StatelessWidget {
  EducationInfo({required this.index});

  late int index;

  @override
  Widget build(BuildContext context) {
    return index % 2 == 0
        ? BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Card(
          elevation: 10.0,
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9,
            height: 160,
            decoration: const BoxDecoration(
              color: Color(0xFFFFEEE6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "http://blood-bank2022.herokuapp.com/dashboard_files/posts/${cubit.educationItemData[index].image}"),
                    radius: 60,
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.05,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            "${cubit.educationItemData[index].title}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.sp,
                                color: const Color(0xFF5D240C),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.01,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            "${cubit.educationItemData[index].description}",
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF787F8F),
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.02,
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                            child: const Text(
                              "Learn more",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFFFF0000)),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      EducationArticlesScreen(description: cubit
                                          .educationItemData[index].description!,
                                        image: cubit.educationItemData[index]
                                            .image!,
                                        title: cubit.educationItemData[index]
                                            .title!,)));
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // child: Material(
            //   elevation: 10.0,
            //   shadowColor: Colors.white,
            // ),
          ),
        );
      },
    )
        : BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Card(
          elevation: 10.0,
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9,
            height: 160,
            decoration: const BoxDecoration(
              color: Color(0xFFF8F8F8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "http://blood-bank2022.herokuapp.com/dashboard_files/posts/${cubit.educationItemData[index].image}"),
                    radius: 60,
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.05,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            "${cubit.educationItemData[index].title}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.sp,
                                color: const Color(0xFF5D240C)),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.02,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            "${cubit.educationItemData[index].description}",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xFF787F8F)),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.02,
                        ),
                        const Spacer(),

                        Align(
                          alignment: Alignment.bottomLeft,
                          child: InkWell(
                            child: const Text(
                              "Learn more",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFFFF0000)),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      EducationArticlesScreen(description: cubit
                                          .educationItemData[index].description!,
                                        image: cubit.educationItemData[index]
                                            .image!,
                                        title: cubit.educationItemData[index]
                                            .title!,)));
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // child: Material(
            //   elevation: 10.0,
            //   shadowColor: Colors.white,
            // ),
          ),
        );
      },
    );
  }
}
