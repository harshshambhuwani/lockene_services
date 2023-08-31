import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:service/Admin/network/model/costome_service_model.dart';
import 'package:service/Admin/network/model/country_model.dart';
import 'package:service/Admin/network/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:service/Admin/network/model/otp_model.dart';
import 'package:service/Admin/network/model/registration_model.dart';
import 'package:service/network/api_path.dart';

class ApiInterface{
  Future<LoginModel> loginUser(String username, String password) async {
    var url = ApisPath().postLogin;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      Map<String, String> headers = {
        'Auth-Key': 'ExVfMAc9A8vQcE3zY0',
        'Client-Service': 'frontend-client'
      };
      request.fields['language'] = "en";
      request.fields['email'] = username;
      request.fields['password'] = password;
      request.headers.addAll(headers);

      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        if (response.statusCode == 200) {
          return LoginModel.fromJson(jsonDecode(response.body));
        } else {
          return LoginModel.fromJson(jsonDecode(response.body));
        }
      } catch (e) {
        debugPrint("fromCatch $e");
      }
      return LoginModel();
    }
  }


  Future<OtpModel> sendOtp(String fullName, String companyName, String emailAddress, String password) async {
    var url = ApisPath().postOtp;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      Map<String, String> headers = {
        'Auth-Key': 'ExVfMAc9A8vQcE3zY0',
        'Client-Service': 'frontend-client'
      };
      request.fields['language'] = "en";
      request.fields['name'] = fullName;
      request.fields['business_name'] = companyName;
      request.fields['email'] = emailAddress;
      request.fields['password'] = password;
      request.headers.addAll(headers);

      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        print("fromOtpApiCallss ${response.statusCode}");
        print("fromOtpApiCallss ${response.body}");
        if (response.statusCode == 200) {
          return OtpModel.fromJson(jsonDecode(response.body));
        //  return response.body;

        } else {
          return OtpModel.fromJson(jsonDecode(response.body));
         // return response.body;
        }
      } catch (e) {
        debugPrint("fromCatchOtp $e");
      }
      return OtpModel();
    }
  }




  Future<CountryModel> getCountry() async {
    var url = ApisPath().postCountry;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      Map<String, String> headers = {
        'Auth-Key': 'ExVfMAc9A8vQcE3zY0',
        'Client-Service': 'frontend-client'
      };
      request.fields['language'] = "en";
      request.headers.addAll(headers);

      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        if (response.statusCode == 200) {
          return CountryModel.fromJson(jsonDecode(response.body));

        } else {
          return CountryModel.fromJson(jsonDecode(response.body));
        }
      } catch (e) {
        debugPrint("fromCatch $e");
      }
      return CountryModel();
    }
  }



  Future<CostomeServiceModel> getCostomeServiceList() async {
    Map<String, String> headers = {
      'Auth-Key': 'ExVfMAc9A8vQcE3zY0',
      'Client-Service': 'frontend-client'
    };
    try {
      final response = await http.post(
          Uri.parse(ApisPath().postGetCostomeServiceList),
          headers: headers,
         );
      if (response.statusCode == 200) {
        return CostomeServiceModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        return CostomeServiceModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 500 || response.statusCode == 504) {
        return CostomeServiceModel(
            status: "Error", message: 'Internal Server Error');
      } else {
        return CostomeServiceModel.fromJson(jsonDecode(response.body));
      }
    } on SocketException catch (_) {
      return CostomeServiceModel();
    }
  }




  Future<RegistrationModel> registerPrivateFsm(
      String? fullName,
      String? companyName,
      String? emailAddress,
      String? passwordValue,
      String phoneNumber,
      String countryValue,
      String stateValue,
      String cityValue,
      String pinCode,
      String addressText) async {
    var url = ApisPath().postRegistrationUrl;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      Map<String, String> headers = {
        'Client-Service': 'frontend-client',
        'Auth-Token': '03c9d4f0a012f9403e2dd3b78a95704b1',
        'Auth-Key': 'ExVfMAc9A8vQcE3zY0',
      };
      request.fields['language'] = "en";
      request.fields['name'] = fullName!;
      request.fields['business_name'] = companyName!;
      request.fields['mobile'] = phoneNumber;
      request.fields['email'] = emailAddress!;
      request.fields['address'] = addressText;
      request.fields['country'] = "101";
      request.fields['state'] = "4008";
      request.fields['city'] = "133116";
      request.fields['pincode'] = pinCode;
      request.fields['auth_type'] = "2";
      request.fields['mfr_id'] = "6";
      request.fields['device_id'] = "1565165";
      request.fields['make_model'] = "225d11";
      request.fields['platform'] = "0";
      request.fields['app_version'] = "1.5";
      request.fields['google_address'] = addressText;
      request.fields['custom_service_support'] = "1";
      request.fields['password'] = passwordValue!;
      request.fields['timezone'] = "Asia/Kolkata";
      request.headers.addAll(headers);

      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        print("ApiCall ${request.fields}");
        print("fromRegistrationApi ${response.body}");
        if (response.statusCode == 200) {
          return RegistrationModel.fromJson(jsonDecode(response.body));

        } else {
          return RegistrationModel.fromJson(jsonDecode(response.body));
        }
      } catch (e) {
        debugPrint("fromCatchasssss $e");
      }
      return RegistrationModel();
    }
  }






}