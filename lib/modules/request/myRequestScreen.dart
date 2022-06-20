import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

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
        if(state is AppSuccessChangeStatueForMyRequestsDataState){
          AppCubit.get(context).getClosedRequests();
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                  child: ListView.separated(
                    itemBuilder: (context, index) => SizedBox(
                      height: 220,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name',style: TextStyle(color: Colors.blueGrey[400],fontSize: 16),),
                                    Text('${myRequestModel?.requests![index].user?.name}',style: const TextStyle(color: Colors.black,fontSize: 20),),
                                    SizedBox(height: 20.h,),
                                    Text('Location',style: TextStyle(color: Colors.blueGrey[400],fontSize: 16),),
                                    Text('${myRequestModel?.requests![index].governorate?.governorateName},${myRequestModel?.requests![index].city?.cityName}',style: const TextStyle(color: Colors.black,fontSize: 20,overflow: TextOverflow.ellipsis),),
                                    SizedBox(height: 20.h,),
                                    Text('Blood Type',style: TextStyle(color: Colors.blueGrey[400],fontSize: 16),),
                                    Text('${myRequestModel?.requests![index].bloodType?.toUpperCase()}',style: const TextStyle(color: Colors.black,fontSize: 20),),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('${myRequestModel?.requests![index].requestExpiredDate}',style: const TextStyle(color: mainColor,fontWeight: FontWeight.bold),),
                                  const Spacer(),
                                  FlutterSwitch(
                                    activeText: 'ON',
                                    activeColor: Colors.green,
                                    inactiveColor: Colors.red,
                                    inactiveText: 'OFF',
                                    value: myRequestModel?.requests![index].status == 1 ? true : false,
                                    onToggle: (value) {
                                      cubit.changeStatueForRequest((myRequestModel?.requests![index].id)!);
                                      if(value == true) myRequestModel?.requests![index].status = 1;
                                      if(value == false) myRequestModel?.requests![index].status = 0;
                                    },
                                  ),
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

//SizedBox(
//                       height: 110,
//                       width: double.infinity,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           CircleAvatar(
//                             radius: 20,
//                             child: Text(
//                               '${myRequestModel?.requests![index].bloodType}',
//                               style: const TextStyle(color: Colors.white),
//                             ),
//                             backgroundColor: mainColor,
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '${myRequestModel?.requests![index].user?.name} needs blood',
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 12,
//                                 ),
//                                 Text(
//                                   'no of bags    ${myRequestModel?.requests![index].noOfBags}',
//                                   style: const TextStyle(
//                                     color: greyColor2,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Date      ${myRequestModel!.requests![index].requestExpiredDate!}',
//                                   style: const TextStyle(
//                                     color: greyColor2,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Location    ${myRequestModel?.requests![index].governorate?.governorateName},${myRequestModel?.requests![index].city?.cityName}',
//                                   style: const TextStyle(
//                                     color: greyColor2,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Column(
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceEvenly,
//                             children: [
//                               IconButton(
//                                 onPressed: () {
//                                   cubit.getCityEditRequestData(id: (myRequestModel!.requests![index].governorate!.id)!);
//                                   indexOfMyRequest = index;
//                                 },
//                                 icon: const Icon(Icons.edit),
//                               ),
//                               IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     cubit.deleteMyRequests(id: myRequestModel!.requests![index].id!);
//                                   });
//                                 },
//                                 icon: const Icon(Icons.delete_outline),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     )