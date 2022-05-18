import 'package:blood_bank/shared/components/components.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/Constant.dart';
import '../../shared/styles/colors.dart';
import 'findDonorScreen.dart';

class FilterDonorScreen extends StatefulWidget {
  const FilterDonorScreen({Key? key}) : super(key: key);

  @override
  State<FilterDonorScreen> createState() => _FilterDonorScreenState();
}

class _FilterDonorScreenState extends State<FilterDonorScreen> {
  var formKey = GlobalKey<FormState>();
  String? bloodTypeFilter;
  int? govIdFilter;
  int? cityIdFilter;
  int? id;

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is AppSuccessFilterDonorState){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => FindDonorScreen()),
                (route) => false,
          );
          cubit.filterCityItemList.clear();
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Filter donor'),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Blood type",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.sp,
                          color: mainColor,
                        ),
                      ),
                      DropdownButtonFormField(
                        items: cubit.bloodGroupItem
                            .map(
                              (label) => DropdownMenuItem(
                            child: Text(
                              label,
                              style: const TextStyle(fontSize: 16),
                            ),
                            value: label,
                          ),
                        )
                            .toList(),
                        onChanged: (value) {
                          bloodTypeFilter = value.toString();
                        },
                        validator: (value) {
                          if (value == null) {
                            return "Blood type must not be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        hint: const Text('Blood type'),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Governorate",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.sp,
                          color: mainColor,
                        ),
                      ),
                      DropdownButtonFormField(
                        hint: const Text(
                          'Governorate',
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Governorate must not be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: governorateItemList.asMap().entries.map((items) {
                          return DropdownMenuItem(
                            value: items.value.governorateName,
                            child: Text(items.value.governorateName!),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            id = governorateItemList.indexWhere((element) => element.governorateName == newValue);
                            govIdFilter = governorateItemList[id!].id;
                            cubit.getFilterCityData(id: governorateItemList[id!].id!);
                          });
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "City",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.sp,
                          color: mainColor,
                        ),
                      ),
                      DropdownButtonFormField(
                        hint: const Text(
                          'City',
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "City must not be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          focusColor: Colors.green,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: greyColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: cubit.filterCityItemList
                            .asMap()
                            .entries
                            .map((items) {
                          return DropdownMenuItem(
                            value: items.value.cityName,
                            child: Text(items.value.cityName!),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          int id = cubit.filterCityItemList.indexWhere(
                                  (element) => element.cityName == newValue);
                          cityIdFilter = (cubit.filterCityItemList[id].id)!;
                        },
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Buttons_without_icon(
                        num_hieght: 50,
                        text_button_name: 'Submit',
                        button_color: mainColor,
                        num_border: 10,
                        num_fontsize: 20,
                        text_fontwwieght: FontWeight.bold,
                        function: (){
                          print(bloodTypeFilter);
                          print(govIdFilter);
                          print(cityIdFilter);
                          cubit.filterDonor(
                            bloodType: bloodTypeFilter!,
                            govId: govIdFilter!,
                            cityId: cityIdFilter!,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
