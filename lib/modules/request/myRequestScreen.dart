import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/Constant.dart';
import '../../shared/styles/colors.dart';
import 'editRequest.dart';

class MyRequestScreen extends StatefulWidget {
  const MyRequestScreen({Key? key}) : super(key: key);

  @override
  State<MyRequestScreen> createState() => _MyRequestScreenState();
}

class _MyRequestScreenState extends State<MyRequestScreen> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){
        if (state is AppSuccessCityEditRequestDataState) {
          idIndexOfCityEditRequest = AppCubit.get(context).cityEditRequestItemList.indexWhere((element) => element.cityName == myRequestModel!.requests![indexOfMyRequest!].city!.cityName);
          print('my request screen state $idIndexOfCityEditRequest');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => EditRequestScreen()),
          );
        }
      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Requests'),
          ),
          body: ConditionalBuilder(
            condition: myRequestModel!.requests != null,
            builder: (context) => RefreshIndicator(
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
                builder: (context) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) => SizedBox(
                      height: 110,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            child: Text(
                              '${myRequestModel?.requests![index].bloodType}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: mainColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${myRequestModel?.requests![index].user?.name} needs blood',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'no of bags    ${myRequestModel?.requests![index].noOfBags}',
                                  style: const TextStyle(
                                    color: greyColor2,
                                  ),
                                ),
                                Text(
                                  'Date      ${myRequestModel!.requests![index].requestExpiredDate!}',
                                  style: const TextStyle(
                                    color: greyColor2,
                                  ),
                                ),
                                Text(
                                  'Location    ${myRequestModel?.requests![index].governorate?.governorateName},${myRequestModel?.requests![index].city?.cityName}',
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
                                  cubit.getCityEditRequestData(id: (myRequestModel!.requests![index].governorate!.id)!);
                                  indexOfMyRequest = index;
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    cubit.deleteMyRequests(id: myRequestModel!.requests![index].id!);
                                  });
                                },
                                icon: const Icon(Icons.delete_outline),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemCount: myRequestModel!.requests!.length,
                  ),
                ),
                fallback: (context) => const Center(
                  child: Text(
                    'No Request Yet !',
                    style: TextStyle(fontSize: 30, color: greyColor),
                  ),
                ),
              ),
            ),
            fallback: (context) => const Center(
              child: Text(
                'No Requests Yet !',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        );
      },
    );
  }
}
