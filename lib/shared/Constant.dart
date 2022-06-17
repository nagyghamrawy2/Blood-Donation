import 'package:blood_bank/models/city_model.dart';
import 'package:blood_bank/models/governate_model.dart';
import 'package:blood_bank/models/profile_model.dart';
import 'package:blood_bank/models/request_model.dart';
import 'package:blood_bank/modules/Login_Screen/login.dart';
import 'package:blood_bank/shared/Network/local/Cache_helper.dart';
import 'package:flutter/material.dart';

import '../models/edit_request_model.dart';

void signOut(context)
{
  CacheHelper.Removedata(Key: 'token').then((value)
  {
    if(value)
    {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  });
}
String token='';

int? govIdProfile;
int? cityIdProfile;
int? idIndexOfCity ;
int? idIndexOfCityEditRequest ;

List<Governorates> governorateItemList = [];
List<Cities> cityItemList = [];

ProfileModel? userDataModel;
RequestModel? myRequestModel;
RequestModel? requestModel;
RequestModel? closedRequestModel;
int? indexOfMyRequest;


String image = userDataModel?.user?.profilePicture != null
    ? '${userDataModel?.user?.profilePicture}'
    : 'assets/images/noImage.png';


