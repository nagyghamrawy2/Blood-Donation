import 'package:blood_bank/models/messageModel.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen(
      {Key? key,
      required this.receiverId,
      required this.name,
      required this.phone,
      required this.Image})
      : super(key: key);

  var messageController = TextEditingController();
  ScrollController listview = ScrollController();
  final date = DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
  String? receiverId;
  String? name;
  String? phone;
  String? Image;
  var collection = FirebaseFirestore.instance
      .collection('Chat')
      .doc(userDataModel?.user?.id.toString())
      .collection("Id");
  var Id;
  bool found = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 55),
              child: SizedBox(
                width: 30,
                child: FloatingActionButton(
                  child: const Icon(Icons.arrow_downward),
                  onPressed: () {
                    listview.animateTo(listview.position.maxScrollExtent,
                        duration: const Duration(seconds: 1),
                        curve: (Curves.easeOut));
                  },
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(237, 57, 74, 1),
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: (Image != null)
                        ? NetworkImage(Image!)
                        : const NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/925px-Unknown_person.jpg'),
                    radius: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: 110,
                      child: Text(
                        name!,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ))
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.call,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    final Uri launchuri = Uri(
                      scheme: 'tel',
                      path: phone,
                    );
                    if (await canLaunchUrl(launchuri)) {
                      await launchUrl((launchuri));
                    }
                  },
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_outlined,
                      color: Colors.black,
                      size: 40,
                    )),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        controller: listview,
                        cacheExtent: 20,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var message = AppCubit.get(context).messages[index];
                          if (userDataModel?.user?.id == message.senderId) {
                            return BuildMyMessage(message);
                          }
                          return BuildMessage(message);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 15,
                            ),
                        itemCount: AppCubit.get(context).messages.length),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                          ),
                          height: 45,
                          child: TextFormField(
                            controller: messageController,
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
                                hintStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 18),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: GestureDetector(
                          child: const Icon(
                            Icons.send,
                            size: 40,
                          ),
                          onTap: () async {
                            if (messageController.text == "") {
                              return;
                            } else {
                              var querySnapshot = await collection.get();
                              for (var queryDocumentSnapshot
                                  in querySnapshot.docs) {
                                Map<String, dynamic> data =
                                    queryDocumentSnapshot.data();
                                if (data['receiverId'].toString() ==
                                    receiverId.toString()) {
                                  Id = queryDocumentSnapshot.id;
                                  found = true;
                                }
                              }
                              if (found == true) {
                                await FirebaseFirestore.instance
                                    .collection('Chat')
                                    .doc(userDataModel?.user?.id.toString())
                                    .collection("Id")
                                    .doc(Id)
                                    .update(<String, dynamic>{
                                  "date": date,
                                  "message": messageController.text,
                                  "image": Image
                                });
                              } else {
                                await FirebaseFirestore.instance
                                    .collection('Chat')
                                    .doc(userDataModel?.user?.id.toString())
                                    .collection("Id")
                                    .add(<String, dynamic>{
                                  "username": name,
                                  "receiverId": receiverId,
                                  "date": date,
                                  "phone": phone,
                                  "message": messageController.text,
                                  "image": Image
                                });
                                await FirebaseFirestore.instance
                                    .collection('Chat')
                                    .doc(receiverId.toString())
                                    .collection("Id")
                                    .add(<String, dynamic>{
                                  "username": userDataModel?.user?.name,
                                  "receiverId":
                                      userDataModel?.user?.id.toString(),
                                  "date": date,
                                  "phone": userDataModel?.user?.phoneNumber
                                      .toString(),
                                  "message": messageController.toString(),
                                  "image": userDataModel?.user?.profilePicture
                                      .toString(),
                                });
                                found = false;
                              }

                              AppCubit.get(context).sendMessage(
                                  receiverId: receiverId.toString(),
                                  date: date,
                                  text: messageController.text);
                              FirebaseMessaging.instance
                                  .getToken()
                                  .then((value) {});
                              AppCubit.get(context).getMessages(
                                  receiverId: receiverId.toString());
                            }
                            listview.animateTo(
                                listview.position.maxScrollExtent,
                                duration: const Duration(seconds: 1),
                                curve: (Curves.easeOut));
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget BuildMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(10),
                    topStart: Radius.circular(10),
                    topEnd: Radius.circular(10))),
            child: Text(model.text!)),
      );

  Widget BuildMyMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            decoration: const BoxDecoration(
                color: greyColor2,
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10),
                    topStart: Radius.circular(10),
                    topEnd: Radius.circular(10))),
            child: Text(
              model.text!,
            )),
      );
}
