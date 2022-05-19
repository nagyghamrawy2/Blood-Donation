import 'package:blood_bank/modules/chat/chatscreen.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                                      )),
                            );
                          },
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                  "assets/images/pp.png",
                                ),
                                radius: 40,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshots.data.docs[i]['username'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
