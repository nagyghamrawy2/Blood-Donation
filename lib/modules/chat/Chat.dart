import 'package:blood_bank/modules/chat/chatscreen.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Chats'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('Chat')
                  .doc(userDataModel?.user?.id.toString())
                  .collection("Id")
                  .orderBy('date', descending: true)
                  .get(),
              builder: (context, AsyncSnapshot snapshots) {
                if (snapshots.hasData == false) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.separated(
                      itemCount: snapshots.data.docs.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () async {
                            await FirebaseFirestore.instance
                                .collection('Chat')
                                .doc(userDataModel?.user?.id.toString())
                                .collection("Id")
                                .orderBy("date")
                                .get();
                            AppCubit.get(context).getMessages(
                                receiverId: snapshots.data.docs[i]['receiverId']
                                    .toString());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                        receiverId: snapshots
                                            .data.docs[i]['receiverId']
                                            .toString(),
                                        name: snapshots.data.docs[i]['username']
                                            .toString(),
                                        phone: snapshots.data.docs[i]['phone']
                                            .toString(),
                                        Image: snapshots.data.docs[i]['image']
                                            .toString(),
                                      )),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 110,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: (snapshots.data.docs[i]
                                                  ["image"] !=
                                              null)
                                          ? NetworkImage(snapshots
                                              .data.docs[i]['image']
                                              .toString())
                                          : const NetworkImage(
                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/925px-Unknown_person.jpg'),
                                      radius: 60.r,
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Text(
                                          snapshots.data.docs[i]['username'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Text(
                                          snapshots.data.docs[i]['message'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black26,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.h),
                                      child: Text(
                                        snapshots.data.docs[i]['date'],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, i) {
                        return const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        );
                      });
                }
              },
            ),
          ),
        );
      },
    );
  }
}
