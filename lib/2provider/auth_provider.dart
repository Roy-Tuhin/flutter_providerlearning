import 'package:flutter/cupertino.dart';
import 'package:flutter_providerlearning/3models/api_model/api_model.dart';
import 'package:flutter_providerlearning/3models/api_model/data_model/auth_model.dart';
import 'package:flutter_providerlearning/global/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier{
  AuthModel authModel = AuthModel();
  
  //!===========================================================================================
  Future registerUser({
    required String userType,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String gender,
    required String medium,
    required BuildContext context,
  }) async{
    final StorageProvider storageProvider = Provider.of<StorageProvider>(context, listen: false);
    Map <String, dynamic> params = {};
    params['user_type'] = userType;
    params['email'] = email;
    params['password'] = password;
    params['first_name'] = firstName;
    params['last_name'] = lastName;
    params['gender'] = gender;
    params['fcm_token'] = storageProvider.fcmToken;
    params['medium'] = medium;

     //registerURI
     var url = AppConstants.baseURL;
     var response = await ApiModel.post(params, url);
     authModel = AuthModel.fromJson(response); // serilazed the data with help of model

     if(authModel.statuscode==200){
      

     }
  }
}