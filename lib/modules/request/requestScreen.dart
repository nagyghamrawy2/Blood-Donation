import 'package:blood_bank/modules/chat/chatscreen.dart';
import 'package:blood_bank/modules/request/editRequest.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Requests'),
                bottom: const TabBar(
                  indicatorColor: mainColor,
                  tabs: <Widget>[
                    Tab(
                      child: Text('All requests'),
                    ),
                    Tab(
                      child: Text('My requests'),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  ConditionalBuilder(
                    condition: requestModel!.requests != null,
                    builder: (context) =>
                        RefreshIndicator(
                          color: Colors.white,
                          backgroundColor: mainColor,
                          strokeWidth: 2,
                          triggerMode: RefreshIndicatorTriggerMode.anywhere,
                          onRefresh: () async {
                            setState(() {
                              cubit.getAllRequests();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0),
                            child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  Container(
                                    height: 110,
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          child: Text(
                                            '${requestModel?.requests![index]
                                                .bloodType}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          backgroundColor: mainColor,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${requestModel
                                                    ?.requests![index].user
                                                    ?.name} needs blood',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                'no of bags    ${requestModel
                                                    ?.requests![index]
                                                    .noOfBags}',
                                                style: const TextStyle(
                                                  color: greyColor2,
                                                ),
                                              ),
                                              Text(
                                                'Date      ${DateFormat('yMMMd')
                                                    .format(requestModel!
                                                    .requests![index]
                                                    .requestExpiredDate!)}',
                                                style: const TextStyle(
                                                  color: greyColor2,
                                                ),
                                              ),
                                              Text(
                                                'Location    ${requestModel
                                                    ?.requests![index]
                                                    .governorate
                                                    ?.governorateName},${requestModel
                                                    ?.requests![index].city
                                                    ?.cityName}',
                                                style: const TextStyle(
                                                  color: greyColor2,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                                    greenColor),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Chat(
                                                            receiverId: requestModel!
                                                                .requests![index]
                                                                .user
                                                                ?.id,
                                                            name: requestModel!
                                                                .requests![index]
                                                                .user
                                                                ?.name,
                                                          )),
                                                );
                                              },
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    'Contact ',
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.chat,
                                                    size: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                                    mainColor),
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                'I can donate',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                              separatorBuilder: (context, index) =>
                              const SizedBox(
                                height: 5,
                              ),
                              itemCount: requestModel!.requests!.length,
                            ),
                          ),
                        ),
                    fallback: (context) =>
                        Center(
                          child: Text('No Requests Yet !',
                              style: TextStyle(fontSize: 30)),
                        ),
                  ),
                  ConditionalBuilder(
                    condition: myRequestModel!.requests != null,
                    builder: (context) =>
                        RefreshIndicator(
                          color: Colors.white,
                          backgroundColor: mainColor,
                          strokeWidth: 2,
                          triggerMode: RefreshIndicatorTriggerMode.anywhere,
                          onRefresh: () async {
                            setState(() {
                              cubit.getMyRequests();
                            });
                          },
                          child: ConditionalBuilder(
                            condition: myRequestModel!.requests!.isNotEmpty,
                            builder: (context) =>
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ListView.separated(
                                    itemBuilder: (context, index) =>
                                        Container(
                                          height: 110,
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .end,
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                child: Text(
                                                  '${myRequestModel
                                                      ?.requests![index]
                                                      .bloodType}',
                                                  style:
                                                  const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor: mainColor,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${myRequestModel
                                                          ?.requests![index]
                                                          .user
                                                          ?.name} needs blood',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 12,
                                                    ),
                                                    Text(
                                                      'no of bags    ${myRequestModel
                                                          ?.requests![index]
                                                          .noOfBags}',
                                                      style: const TextStyle(
                                                        color: greyColor2,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Date      ${DateFormat(
                                                          'yMMMd').format(
                                                          myRequestModel!
                                                              .requests![index]
                                                              .requestExpiredDate!)}',
                                                      style: const TextStyle(
                                                        color: greyColor2,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Location    ${myRequestModel
                                                          ?.requests![index]
                                                          .governorate
                                                          ?.governorateName},${myRequestModel
                                                          ?.requests![index]
                                                          .city?.cityName}',
                                                      style: const TextStyle(
                                                        color: greyColor2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      // cubit.updateRequest(
                                                      //   title: 'test2',
                                                      //   description: 'test2',
                                                      //   phone: '01101171299',
                                                      //   numberOfBags: '3',
                                                      //   expiredDate: '2022-07-6',
                                                      //   bloodType: 'O+',
                                                      //   govId: '1',
                                                      //   cityId: '2',
                                                      //   id: myRequestModel!.requests![index].id!,
                                                      // );
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                EditRequestScreen(
                                                                  title: myRequestModel?.requests?[index].title,
                                                                  description: myRequestModel?.requests?[index].description,
                                                                  phone: myRequestModel?.requests?[index].phoneNumber,
                                                                  numberOfBags: myRequestModel?.requests?[index].noOfBags.toString(),
                                                                  expiredDate: myRequestModel?.requests?[index].requestExpiredDate.toString(),
                                                                  bloodType: myRequestModel?.requests?[index].bloodType,
                                                                  govId: myRequestModel?.requests?[index].governorate?.id.toString(),
                                                                  cityId: myRequestModel?.requests?[index].city?.id.toString(),
                                                                  id: myRequestModel!.requests![index].id!,
                                                                )),
                                                      );
                                                    },
                                                    icon: const Icon(
                                                        Icons.edit),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        cubit.deleteMyRequests(
                                                            id: myRequestModel!
                                                                .requests![index]
                                                                .id!);
                                                      });
                                                    },
                                                    icon: const Icon(
                                                        Icons.delete_outline),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                    separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    itemCount: myRequestModel!.requests!.length,
                                  ),
                                ),
                            fallback: (context) =>
                                Center(
                                  child: Text(
                                    'No Request Yet !',
                                    style: TextStyle(
                                        fontSize: 30, color: greyColor),
                                  ),
                                ),
                          ),
                        ),
                    fallback: (context) =>
                        Center(
                          child: Text(
                            'No Requests Yet !',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                  ),
                  // ConditionalBuilder(
                  //   condition: myRequestModel?.requests != null,
                  //   builder: (context) => Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //     child: ListView.separated(
                  //       itemBuilder: (context, index) => Container(
                  //         height: 110,
                  //         width: double.infinity,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.end,
                  //           children: [
                  //             CircleAvatar(
                  //               radius: 20,
                  //               child: Text(
                  //                 '${myRequestModel?.requests![index].bloodType}',
                  //                 style: const TextStyle(color: Colors.white),
                  //               ),
                  //               backgroundColor: mainColor,
                  //             ),
                  //             const SizedBox(
                  //               width: 10,
                  //             ),
                  //             Expanded(
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     '${myRequestModel?.requests![index].user?.name} needs blood',
                  //                     style: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   const SizedBox(
                  //                     height: 12,
                  //                   ),
                  //                   Text(
                  //                     'no of bags    ${myRequestModel?.requests![index].noOfBags}',
                  //                     style: const TextStyle(
                  //                       color: greyColor2,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     'Date      ${DateFormat('yMMMd').format(myRequestModel!.requests![index].requestExpiredDate!)}',
                  //                     style: const TextStyle(
                  //                       color: greyColor2,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     'Location    ${myRequestModel?.requests![index].governorate?.governorateName},${myRequestModel?.requests![index].city?.cityName}',
                  //                     style: const TextStyle(
                  //                       color: greyColor2,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Column(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceEvenly,
                  //               children: [
                  //                 IconButton(
                  //                   onPressed: () {
                  //                     Navigator.push(
                  //                       context,
                  //                       MaterialPageRoute(
                  //                           builder: (context) =>
                  //                               EditRequestScreen()),
                  //                     );
                  //                   },
                  //                   icon: const Icon(Icons.edit),
                  //                 ),
                  //                 IconButton(
                  //                   onPressed: () {
                  //                     setState(() {
                  //                       cubit.deleteMyRequests(id: myRequestModel!.requests![index].id!);
                  //                     });
                  //                   },
                  //                   icon: const Icon(Icons.delete_outline),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       separatorBuilder: (context, index) => const SizedBox(
                  //         height: 5,
                  //       ),
                  //       itemCount: myRequestModel!.requests!.length,
                  //     ),
                  //   ),
                  //   fallback: (context) => Center(
                  //     child: CircularProgressIndicator(
                  //       color: mainColor,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        });
  }
}
