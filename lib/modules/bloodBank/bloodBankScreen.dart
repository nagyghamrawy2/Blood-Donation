import 'package:blood_bank/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/styles/colors.dart';

class BloodBankScreen extends StatelessWidget {
  List<Map<String, dynamic>> hospitals = [
    {
      'image':
          'https://lh5.googleusercontent.com/p/AF1QipOg_JWW0u659Uyhcsm51z2wSxRfPfv2Ees407FH=w408-h544-k-no',
      'name': 'Helwan General Hospital',
      'location':
          'Intersection Of Faidy St, Helwan Sharkeya, Helwan, Cairo Governorate 4037001',
      'number': '0225564364',
      'gps': 'https://goo.gl/maps/Ptk3vyHfS2AkhTBT6'
    },
    {
      'image':
          'https://lh5.googleusercontent.com/p/AF1QipO4Iv3ya9vL4i7opr1DCaeEYDnAIEFrcydO3aNe=w439-h240-k-no',
      'name': 'Town Hospital',
      'location': '14 - 15 Street 53, New Cairo 1, Cairo Governorate 4723315',
      'number': '0225650291',
      'gps': 'https://g.page/TownHospital?share'
    },
    {
      'image':
          'https://lh5.googleusercontent.com/p/AF1QipPHazTVIK5eaJ7J1-YpSj_P3_sAP_2TZbaadexc=w408-h408-k-no',
      'name': 'Altagamoaa Alawal Hospital',
      'location':
          '2FM8+CHM, Altagamoaa Alawal, Sheraton Al Matar, El Nozha, Cairo Governorate',
      'number': '0225268914',
      'gps': 'https://goo.gl/maps/UMzpWMdycxvBaat89'
    },
    {
      'image':
          'https://lh5.googleusercontent.com/p/AF1QipMUYMkGd8TfaMEwTwf6bWbMq5fdA1z6nSG2OoNe=w408-h479-k-no',
      'name': 'Aman Private Hospital',
      'location':
          '29 Intersection Of Mostafa Fahmy St، Helwan Sharkeya, Helwan',
      'number': 'V82P+JJ Helwan',
      'gps': 'https://goo.gl/maps/JNNeaCfMsz6Ww3aq8'
    },
    {
      'image': 'https://maps.gstatic.com/tactile/pane/default_geocode-2x.png',
      'name': 'San George Hospital',
      'location':
          '25 Mohamed Sayed Ahmed St.، Helwan, Cairo Governorate 4036420',
      'number': '0225599494',
      'gps': 'https://goo.gl/maps/3yuMB1pDRdZVbZkU8'
    },
    {
      'image': 'https://maps.gstatic.com/tactile/pane/default_geocode-2x.png',
      'name': 'As-Salam International Hospital Maadi Branch',
      'location':
          'Maadi Al Khabiri Al Gharbeyah, Maadi, Cairo Governorate 4211220',
      'number': '01092001443',
      'gps': 'https://goo.gl/maps/rnAwTzVwcdLuji5v8'
    },
    {
      'image':
          'https://lh5.googleusercontent.com/p/AF1QipPMiGS3AqiL4s1k8DqzcfWgfl7d1y3pYJfuSQrI=w408-h544-k-no',
      'name': 'Nile Badrawi Hospital',
      'location': 'Athar an Nabi, Old Cairo, Cairo Governorate 4220501',
      'number': '0225240022',
      'gps': 'https://goo.gl/maps/QmEha2eSQgoqQzsTA'
    },
    {
      'image':
          'https://lh5.googleusercontent.com/p/AF1QipMvNrNYV2DLh3u_Bhro0gJ_E8FwMaiY6xPE1GlR=w426-h240-k-no',
      'name': 'Nile Badrawi Hospital',
      'location': 'Giza District, Giza Governorate 3543377',
      'number': '0235624758',
      'gps': 'https://goo.gl/maps/yRMMZakSExaf8K3P8'
    },
    {
      'image':
          'https://lh5.googleusercontent.com/p/AF1QipMkJNtCeJyWb-DoK14SOmt1hw3hwDdU6dCHW7Ws=w408-h408-k-no',
      'name': 'Gannah Hospital & IVF',
      'location':
          '231 Al Haram, Oula Al Haram, El Omraniya, Giza Governorate 3537220',
      'number': '01120898991',
      'gps': 'https://goo.gl/maps/gLtHNKUsUF1DEeEdA'
    },
    {
      'image':
          'https://lh5.googleusercontent.com/p/AF1QipOUHVK36lSAckKM7Kcb_L4AyCHNkdW4VfP4JViO=w426-h240-k-no',
      'name': 'Imbaba General Hospital',
      'location': 'Madinet Al Eelam, Agouza, Giza Governorate 3755153',
      'number': '0233040117',
      'gps': 'https://goo.gl/maps/YS5XeQoArhHT8zPCA'
    },
  ];

  BloodBankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood bank'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 301.55,
              child: Image.asset(
                "assets/images/hospital.jpg",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => BloodBankInfo(hospitals,index),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 40,
                ),
                itemCount: hospitals.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BloodBankInfo extends StatelessWidget {
  BloodBankInfo(
      this.listOfHospital,
      this.index,
      );

  List<Map<String,dynamic>> listOfHospital;
  int index;
  // late String hospitalImage;
  // late String hospitalName;
  // late String hospitalAddress;
  // late String hospitalAddressMap;
  // late String hospitalPhone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: double.infinity,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(listOfHospital[index]['image']),
              radius: 29,
            ),
            SizedBox(
              width: 12.h,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listOfHospital[index]['name'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    listOfHospital[index]['location'],
                    style: TextStyle(
                      color: greyColor2,
                      fontSize: 20.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/phone-call.svg",
                      color: greenColor,
                    ),
                    onPressed: () async {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: listOfHospital[index]['number'],
                      );
                      if (await canLaunchUrl(launchUri)) {
                        await launchUrl((launchUri));
                      }
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(
                      Icons.location_on,
                      color: mainColor,
                      size: 30,
                    ),
                    onPressed: () async {
                      String url = listOfHospital[index]['gps'];
                      if (await canLaunch(url)) {
                        await launch((url));
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
