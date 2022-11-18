import 'package:dio/dio.dart';

class ApiModel{
  static Dio? dio;

  static Future post(Map<String, dynamic> params, String url) async{
    Response response;
    dio!.options.headers["Content-Type"] = "application/json";
    dio!.options.headers["Authorization"] = "Bearer $token";
    try{
      response = await dio!.post(url, data: params);
      return response.data;
    }catch (e){
      print(e.toString());
      return {"code": -999, "message": "$url|$e"};
    }
  }
}