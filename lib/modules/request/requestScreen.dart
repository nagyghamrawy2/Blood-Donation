import 'package:blood_bank/modules/chat/chatscreen.dart';
import 'package:blood_bank/modules/request/editRequest.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                      child: Text('Open Requests'),
                    ),
                    Tab(
                      child: Text('Closed Requests'),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  ConditionalBuilder(
                    condition: requestModel!.requests != null &&
                        requestModel!.requests!.isNotEmpty,
                    builder: (context) => RefreshIndicator(
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
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.separated(
                          itemBuilder: (context, index) => SizedBox(
                            height: 220,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name',
                                          style: TextStyle(
                                              color: Colors.blueGrey[400],
                                              fontSize: 16),
                                        ),
                                        Text(
                                          '${requestModel?.requests![index].user?.name}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Text(
                                          'Location',
                                          style: TextStyle(
                                              color: Colors.blueGrey[400],
                                              fontSize: 16),
                                        ),
                                        Text(
                                          '${requestModel?.requests![index].governorate?.governorateName},${requestModel?.requests![index].city?.cityName}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Text(
                                          'Blood Type',
                                          style: TextStyle(
                                              color: Colors.blueGrey[400],
                                              fontSize: 16),
                                        ),
                                        Text(
                                          '${requestModel?.requests![index].noOfBags} bags of ${requestModel?.requests![index].bloodType?.toUpperCase()}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${requestModel?.requests![index].requestExpiredDate}',
                                          style: const TextStyle(
                                              color: mainColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            AppCubit.get(context).getMessages(
                                                receiverId: requestModel!
                                                    .requests![index].user!.id
                                                    .toString());
                                            if (requestModel!
                                                    .requests![index].user?.id
                                                    .toString() ==
                                                userDataModel?.user?.id
                                                    .toString()) {
                                              return;
                                            } else {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChatScreen(
                                                          receiverId:
                                                              requestModel!
                                                                  .requests![
                                                                      index]
                                                                  .user
                                                                  ?.id
                                                                  .toString(),
                                                          name: requestModel!
                                                              .requests![index]
                                                              .user
                                                              ?.name,
                                                          phone: requestModel!
                                                              .requests![index]
                                                              .user
                                                              ?.phoneNumber,
                                                          Image:
                                                              'https://blood-bank2022.herokuapp.com/dashboard_files/users_pictures/${requestModel!.requests![index].user?.profilePicture}',
                                                        )),
                                              );
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.chat,
                                            size: 30,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'DONATE',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: mainColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                          itemCount: requestModel!.requests!.length,
                        ),
                      ),
                    ),
                    fallback: (context) => const Center(
                      child: Text('No Requests Yet !',
                          style: TextStyle(fontSize: 30)),
                    ),
                  ),
                  ConditionalBuilder(
                    condition: closedRequestModel!.requests != null &&
                        closedRequestModel!.requests!.isNotEmpty,
                    builder: (context) => RefreshIndicator(
                      color: Colors.white,
                      backgroundColor: mainColor,
                      strokeWidth: 2,
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      onRefresh: () async {
                        setState(() {
                          cubit.getClosedRequests();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.separated(
                          itemBuilder: (context, index) => SizedBox(
                            height: 220,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name',
                                          style: TextStyle(
                                              color: Colors.blueGrey[400],
                                              fontSize: 16),
                                        ),
                                        Text(
                                          '${closedRequestModel?.requests![index].user?.name}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Text(
                                          'Location',
                                          style: TextStyle(
                                              color: Colors.blueGrey[400],
                                              fontSize: 16),
                                        ),
                                        Text(
                                          '${closedRequestModel?.requests![index].governorate?.governorateName},${closedRequestModel?.requests![index].city?.cityName}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Text(
                                          'Blood Type',
                                          style: TextStyle(
                                              color: Colors.blueGrey[400],
                                              fontSize: 16),
                                        ),
                                        Text(
                                          '${closedRequestModel?.requests![index].noOfBags} bags of ${closedRequestModel?.requests![index].bloodType?.toUpperCase()}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${closedRequestModel?.requests![index].requestExpiredDate}',
                                          style: const TextStyle(
                                              color: mainColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            AppCubit.get(context).getMessages(
                                                receiverId: closedRequestModel!
                                                    .requests![index].user!.id
                                                    .toString());
                                            if (requestModel!
                                                    .requests![index].user?.id
                                                    .toString() ==
                                                userDataModel?.user?.id
                                                    .toString()) {
                                              return;
                                            } else {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChatScreen(
                                                            receiverId:
                                                                requestModel!
                                                                    .requests![
                                                                        index]
                                                                    .user
                                                                    ?.id
                                                                    .toString(),
                                                            name:
                                                                requestModel!
                                                                    .requests![
                                                                        index]
                                                                    .user
                                                                    ?.name,
                                                            phone: requestModel!
                                                                .requests![
                                                                    index]
                                                                .user
                                                                ?.phoneNumber,
                                                            Image:
                                                                'https://blood-bank2022.herokuapp.com/dashboard_files/users_pictures/${requestModel!.requests![index].user?.profilePicture}')),
                                              );
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.chat,
                                            size: 30,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'DONATE',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: mainColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                          itemCount: closedRequestModel!.requests!.length,
                        ),
                      ),
                    ),
                    fallback: (context) => RefreshIndicator(
                      color: Colors.white,
                      backgroundColor: mainColor,
                      strokeWidth: 2,
                      triggerMode: RefreshIndicatorTriggerMode.anywhere,
                      onRefresh: () async {
                        setState(() {
                          cubit.getClosedRequests();
                        });
                      },
                      child: const Center(
                        child: Text('No Requests Yet !',
                            style: TextStyle(fontSize: 30)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
