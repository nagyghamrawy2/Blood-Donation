import 'package:blood_bank/modules/home/home.dart';
import 'package:blood_bank/shared/cubit/cubit.dart';
import 'package:blood_bank/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: Container(
              child: Text('Home'),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {},
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              clipBehavior: Clip.antiAlias,
              notchMargin: 10,
              child: BottomNavigationBar(
                currentIndex: AppCubit.get(context).currentIndex,
                onTap: (int index){
                  print(index);
                },
                items: [
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
              // child: Container(
              //
              //   height: 62.5,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.end,
              //     children: [
              //       Row(
              //         children: [
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               MaterialButton(
              //                 onPressed: (){},
              //                 child: Column(
              //                   children: [
              //                     const Image(
              //                       image: AssetImage('assets/images/home.png'),
              //                       height: 31,
              //                       width: 32,
              //                     ),
              //                     const Text('Home'),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               MaterialButton(
              //                 onPressed: (){},
              //                 child: Column(
              //                   children: [
              //                     const Image(
              //                       image: AssetImage('assets/images/requests.png'),
              //                       height: 31,
              //                       width: 32,
              //                     ),
              //                     Text('Requests'),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               MaterialButton(
              //                 onPressed: (){},
              //                 child: Column(
              //                   children: [
              //                     const Image(
              //                       image: AssetImage('assets/images/education.png'),
              //                       height: 31,
              //                       width: 32,
              //                     ),
              //                     Text('Education'),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               MaterialButton(
              //                 onPressed: (){},
              //                 child: Column(
              //                   children: [
              //                     const Image(
              //                       image: AssetImage('assets/images/profile.png'),
              //                       height: 31,
              //                       width: 32,
              //                     ),
              //                     Text('Profile'),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ),
          );
        },
      ),
    );
  }
}
