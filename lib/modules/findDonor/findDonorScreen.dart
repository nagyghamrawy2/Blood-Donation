import 'package:blood_bank/layout/home_layout.dart';
import 'package:blood_bank/modules/findDonor/filterDonorScreen.dart';
import 'package:blood_bank/shared/Constant.dart';
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
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => HomeLayout()), (route) => false,);
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
                          "https://blood-bank2022.herokuapp.com/dashboard_files/users_pictures/${cubit.donorModel.users[index].profilePicture}",
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
              backgroundImage: NetworkImage(imageLink),
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
