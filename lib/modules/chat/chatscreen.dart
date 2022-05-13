import 'package:blood_bank/modules/chat/messageModel.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chat extends StatelessWidget {
  Chat({required this.receiverId});

  var messageC = TextEditingController();
  final now = DateTime.now();
  int? receiverId;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      AppCubit.get(context)
          .getMessages(reciverId: receiverId.toString());
      return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
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
              body: ConditionalBuilder(
                condition: true,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              var message =
                                  AppCubit.get(context).messages[index];
                              if (userDataModel?.user?.id == message.senderId)
                                return BuildMyMessage(message);
                              return BuildMessage(message);
                            },
                            separatorBuilder: (context, state) => SizedBox(
                                  height: 15,
                                ),
                            itemCount: AppCubit.get(context).messages.length),
                      ),
                      Container(
                        margin: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(48),
                                ),
                                height: 55,
                                child: TextField(
                                  controller: messageC,
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
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
                                ),
                                onTap: () {
                                  AppCubit.get(context).sendMessage(
                                      reciverId: userDataModel?.user?.id.toString(),
                                      date: DateTime.now().toString(),
                                      text: messageC.text);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
            );
          });
    });
  }

  Widget BuildMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
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
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                color: Color.fromRGBO(128, 128, 128, 1.0),
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10),
                    topStart: Radius.circular(10),
                    topEnd: Radius.circular(10))),
            child: Text(model.text!)),
      );
}
