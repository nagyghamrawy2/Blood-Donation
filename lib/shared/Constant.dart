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
      myRequestModel?.requests?.clear();
      requestModel?.requests?.clear();
      govIdProfile = null;
      cityIdProfile = null;
      idIndexOfCity = null;
      idIndexOfCityEditRequest = null;
      govRequestId = null;
      cityRequestId = null;
      governorateItemList.clear();
      cityItemList.clear();
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  });
}
String? token='';

int? govIdProfile;
int? cityIdProfile;
int? idIndexOfCity ;
int? idIndexOfCityEditRequest ;

int? govRequestId;
int? cityRequestId;

List<Governorates> governorateItemList = [];
List<Cities> cityItemList = [];

ProfileModel? userDataModel;
RequestModel? myRequestModel;
RequestModel? requestModel;
RequestModel? closedRequestModel;
int? indexOfMyRequest;


String imageUserLogin = userDataModel?.user?.profilePicture != null
    ? 'https://blood-bank2022.herokuapp.com/dashboard_files/users_pictures/${userDataModel?.user?.profilePicture}'
    : 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/925px-Unknown_person.jpg';

RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

bool validatePassword(String pass){
  String _password = pass.trim();
  if(regex.hasMatch(_password)){
    return true;
  }else{
    return false;
  }
}