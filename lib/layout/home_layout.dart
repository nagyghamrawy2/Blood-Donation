import 'package:blood_bank/modules/add_request/addRequest.dart';
import 'package:blood_bank/modules/home/homeScreen.dart';
import 'package:blood_bank/shared/Constant.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:blood_bank/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return ConditionalBuilder(
            condition: userDataModel != null ,
            builder: (context) {
              return Scaffold(
                body: cubit.screens[cubit.currentIndex],
                floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    // print(governorateItemList[29].id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddRequestScreen()),
                    );
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  clipBehavior: Clip.antiAlias,
                  notchMargin: 10,
                  child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      currentIndex: AppCubit.get(context).currentIndex,
                      onTap: (int index) {
                        cubit.changeIndex(index);
                      },
                      items: const [
                        BottomNavigationBarItem(
                          icon: Image(
                            image: AssetImage('assets/images/home.png'),
                            height: 31,
                            width: 32,
                          ),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Image(
                            image: AssetImage('assets/images/requests.png'),
                            height: 31,
                            width: 32,
                          ),
                          label: 'Requests',
                        ),
                        BottomNavigationBarItem(
                          icon: Image(
                            image: AssetImage('assets/images/education.png'),
                            height: 31,
                            width: 32,
                          ),
                          label: 'Education',
                        ),
                        BottomNavigationBarItem(
                          icon: Image(
                            image: AssetImage('assets/images/profile.png'),
                            height: 31,
                            width: 32,
                          ),
                          label: 'Profile',
                        ),
                      ]),
                ),
              );
            },
            fallback: (context) {
              return Material(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Loading',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                    CircularProgressIndicator(
                      color: mainColor,
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
