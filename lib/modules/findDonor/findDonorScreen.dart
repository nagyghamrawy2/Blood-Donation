import 'package:blood_bank/modules/findDonor/filterDonorScreen.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/cubit/states.dart';
import '../../shared/styles/colors.dart';

class FindDonorScreen extends StatefulWidget {
  FindDonorScreen({Key? key}) : super(key: key);

  @override
  State<FindDonorScreen> createState() => _FindDonorScreenState();
}

class _FindDonorScreenState extends State<FindDonorScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  late int id;
  String? bloodTypeFilter;
  int? govIdFilter;
  int? cityIdFilter;

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: const Text('Find a donor'),
            leading: IconButton(
              onPressed: () {
                cubit.getDonorData();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: RefreshIndicator(
            color: Colors.white,
            backgroundColor: mainColor,
            strokeWidth: 2,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: () async {
              setState(() {
                cubit.getDonorData();
              });
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/images/finddonor.jpg"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => FindDonorInfo(
                          "assets/images/pp.png",
                          "${cubit.donorModel.users[index].name}",
                          "${cubit.donorModel.users[index].governorate?.governorateName}",
                          "${cubit.donorModel.users[index].city?.cityName}",
                          "${cubit.donorModel.users[index].bloodType}"),
                      separatorBuilder: (context, index) => Divider(
                        endIndent: 15,
                        indent: 15,
                        color: greyColor,
                        thickness: 1,
                        height: 40.h,
                      ),
                      itemCount: cubit.donorModel.users.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: mainColor,
            child: const Icon(Icons.filter_alt_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FilterDonorScreen()));
              // if (isBottomSheetShown) {
              //   if (formKey.currentState!.validate()) {
              //     cubit.filterDonor(
              //         bloodType: bloodTypeFilter!,
              //         govId: govIdFilter!,
              //         cityId: cityIdFilter!,
              //     );
              //     if (state is AppSuccessFilterDonorState) {
              //       Navigator.pop(context);
              //     }
              //     isBottomSheetShown = false;
              //   }
              // } else {
              //   scaffoldKey.currentState?.showBottomSheet((context) {
              //     return Container(
              //       height: 500.h,
              //       color: greyColor,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(
              //             vertical: 6, horizontal: 40),
              //         child: SingleChildScrollView(
              //           child: Form(
              //             key: formKey,
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   "Blood type",
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 28.sp,
              //                     color: mainColor,
              //                   ),
              //                 ),
              //                 Container(
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(10),
              //                     color: Colors.white,
              //                   ),
              //                   height: 65,
              //                   width: double.infinity,
              //                   child: DropdownButtonFormField<String>(
              //                     items: cubit.bloodGroupItem
              //                         .map(
              //                           (label) => DropdownMenuItem(
              //                             child: Text(
              //                               label,
              //                               style:
              //                                   const TextStyle(fontSize: 16),
              //                             ),
              //                             value: label,
              //                           ),
              //                         )
              //                         .toList(),
              //                     onChanged: (value) {
              //                       bloodTypeFilter = value.toString();
              //                     },
              //                     validator: (value) {
              //                       if (value == null) {
              //                         return "Blood type must not be empty";
              //                       }
              //                       return null;
              //                     },
              //                     decoration: InputDecoration(
              //                       enabledBorder: OutlineInputBorder(
              //                         borderSide: const BorderSide(
              //                           width: 1,
              //                         ),
              //                         borderRadius: BorderRadius.circular(10),
              //                       ),
              //                       focusedBorder: OutlineInputBorder(
              //                         borderRadius: BorderRadius.circular(10),
              //                       ),
              //                     ),
              //                     hint: const Text('Blood type'),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   height: 8.h,
              //                 ),
              //                 Text(
              //                   "Governorate",
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 28.sp,
              //                     color: mainColor,
              //                   ),
              //                 ),
              //                 Container(
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(10),
              //                     color: Colors.white,
              //                   ),
              //                   height: 65,
              //                   width: double.infinity,
              //                   child: DropdownButtonFormField(
              //                     hint: const Text(
              //                       'Governorate',
              //                     ),
              //                     validator: (value) {
              //                       if (value == null) {
              //                         return "Governorate must not be empty";
              //                       }
              //                       return null;
              //                     },
              //                     decoration: InputDecoration(
              //                       enabledBorder: OutlineInputBorder(
              //                         borderSide: const BorderSide(
              //                           width: 1,
              //                         ),
              //                         borderRadius: BorderRadius.circular(10),
              //                       ),
              //                       focusedBorder: OutlineInputBorder(
              //                         borderRadius: BorderRadius.circular(10),
              //                       ),
              //                     ),
              //                     icon: const Icon(Icons.keyboard_arrow_down),
              //                     items: governorateItemList
              //                         .asMap()
              //                         .entries
              //                         .map((items) {
              //                       return DropdownMenuItem(
              //                         value: items.value.governorateName,
              //                         child: Text(items.value.governorateName!),
              //                       );
              //                     }).toList(),
              //                     onChanged: (newValue) {
              //                       setState(() {
              //                         id = governorateItemList.indexWhere((element) => element.governorateName == newValue);
              //                         cubit.getFilterCityData(id: governorateItemList[id].id!);
              //                       });
              //                     },
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   height: 8.h,
              //                 ),
              //                 Text(
              //                   "City",
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 28.sp,
              //                     color: mainColor,
              //                   ),
              //                 ),
              //                 Container(
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(10),
              //                       color: Colors.white,
              //                     ),
              //                     height: 65,
              //                     width: double.infinity,
              //                     child: DropdownButtonFormField(
              //                       hint: const Text(
              //                         'City',
              //                       ),
              //                       validator: (value) {
              //                         if (value == null) {
              //                           return "City must not be empty";
              //                         }
              //                         return null;
              //                       },
              //                       decoration: InputDecoration(
              //                         focusColor: Colors.green,
              //                         focusedBorder: OutlineInputBorder(
              //                           borderRadius:
              //                           BorderRadius.circular(10),
              //                           borderSide: const BorderSide(
              //                             color: greyColor,
              //                           ),
              //                         ),
              //                         enabledBorder: OutlineInputBorder(
              //                           borderSide: const BorderSide(
              //                             width: 1,
              //                           ),
              //                           borderRadius:
              //                           BorderRadius.circular(10),
              //                         ),
              //                         errorBorder: OutlineInputBorder(
              //                           borderSide: const BorderSide(
              //                               color: Colors.red,
              //                               width: 1),
              //                           borderRadius:
              //                           BorderRadius.circular(20),
              //                         ),
              //                         focusedErrorBorder:
              //                         OutlineInputBorder(
              //                           borderRadius:
              //                           BorderRadius.circular(10),
              //                         ),
              //                       ),
              //                       icon: const Icon(Icons.keyboard_arrow_down),
              //                       items: cubit.filterCityItemList
              //                           .asMap()
              //                           .entries
              //                           .map((items) {
              //                         return DropdownMenuItem(
              //                           value: items.value.cityName,
              //                           child: Text(items.value.cityName!),
              //                         );
              //                       }).toList(),
              //                       onChanged: (newValue) {
              //                         int id = cubit.filterCityItemList.indexWhere((element)=>element.cityName ==newValue);
              //                         cityIdFilter = (cubit.filterCityItemList[id].id)!;
              //                       },
              //                     )
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     );
              //   });
              //   isBottomSheetShown = true;
              // }
            },

          ),
        );
      },
    );
  }
}

class FindDonorInfo extends StatelessWidget {
  FindDonorInfo(
      this.imageLink, this.name, this.governorate, this.city, this.bloodType,
      {Key? key})
      : super(key: key);
  String imageLink;
  String name;
  String governorate;
  String city;
  String bloodType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                imageLink,
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
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  '$governorate,$city',
                  style: const TextStyle(
                    color: greyColor2,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 28,
                    width: 85,
                    child: const Center(
                      child: Text(
                        'Ask for help',
                        textScaleFactor: 1,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: mainColor,
                    ),
                  ),
                ),
                Container(
                  height: 21,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(26)),
                  child: Center(
                      child: Text(
                        bloodType,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
