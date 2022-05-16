import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('CHATS'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(userDataModel?.user?.id.toString())
                  .collection("chats")
                  .get(),
              builder: (context, AsyncSnapshot snapshots) {
                print(snapshots.data.docs[0]["chats"]);
                if (snapshots.hasData == false)

                  return Center(child: CircularProgressIndicator());
                else {
                  return ListView.separated(
                      itemCount: snapshots.data.docs.length,
                      itemBuilder: (context, i) {
                        return Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "",
                              ),
                              radius: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshots.data.docs[i]["chats"],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, i) {
                        return Divider(
                          color: Colors.grey,
                          thickness: 5,
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
