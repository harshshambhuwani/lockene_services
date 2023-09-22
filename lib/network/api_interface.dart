import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:service/Admin/network/model/add_client.dart';
import 'package:service/Admin/network/model/costome_service_model.dart';
import 'package:service/Admin/network/model/country_model.dart';
import 'package:service/Admin/network/model/get_client_list_model.dart';
import 'package:service/Admin/network/model/line_list_model.dart';
import 'package:service/Admin/network/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:service/Admin/network/model/otp_model.dart';
import 'package:service/Admin/network/model/quote_list_model.dart';
import 'package:service/Admin/network/model/registration_model.dart';
import 'package:service/Admin/network/model/reset_password_model.dart';
import 'package:service/Admin/network/model/save_line_model.dart';
import 'package:service/Admin/network/model/update_profile_model.dart';
import 'package:service/network/api_path.dart';

class ApiInterface {
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

  Future<OtpModel> sendOtp(String fullName, String companyName,
      String emailAddress, String password) async {
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
      request.fields['country'] = countryValue;
      request.fields['state'] = stateValue;
      request.fields['city'] = cityValue;
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

  Future<ResetPasswodModel> sendPasswordResetLink(String emailAddress) async {
    var url = ApisPath().postForgotResetLink;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      Map<String, String> headers = {
        'Client-Service': 'frontend-client',
        'Auth-Token': '03c9d4f0a012f9403e2dd3b78a95704b1',
        'Auth-Key': 'ExVfMAc9A8vQcE3zY0',
      };
      request.fields['email'] = emailAddress;
      request.headers.addAll(headers);

      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        print("ApiCall ${request.fields}");
        print("fromRegistrationApi ${response.body}");
        print("fromRegistrationApi ${ApisPath().postForgotResetLink}");
        if (response.statusCode == 200) {
          return ResetPasswodModel.fromJson(jsonDecode(response.body));
        } else {
          return ResetPasswodModel.fromJson(jsonDecode(response.body));
        }
      } catch (e) {
        debugPrint("fromCatchasssss $e");
      }
      return ResetPasswodModel();
    }
  }

  // Future<GetProfileModel> getProfileInformation(
  //     String userToken, String useId) async {
  //   var url = ApisPath().postGetProfileInfo;
  //   var request = http.MultipartRequest('POST', Uri.parse("https://mistrichacha.com/tsit/Fsm/viewFsmProfile"));
  //   {
  //     Map<String, String> headerssss = {
  //       'Client-Service': 'frontend-client',
  //       'Auth-Token': userToken,
  //     };
  //     request.fields['user_id'] = "3812";
  //     request.headers.addAll(headerssss);
  //
  //     try {
  //       var streamedResponse = await request.send();
  //       var response = await http.Response.fromStream(streamedResponse);
  //       print("ApiCall ${request.fields}");
  //       print("getProfileInformation ${response.body}");
  //       print("getProfileInformation ${ApisPath().postGetProfileInfo}");
  //       if (response.statusCode == 200) {
  //         return GetProfileModel.fromJson(jsonDecode(response.body));
  //
  //       } else {
  //         return GetProfileModel.fromJson(jsonDecode(response.body));
  //       }
  //     } catch (e) {
  //       debugPrint("fromCatchasssss $e");
  //     }
  //     return GetProfileModel();
  //   }
  // }

  Future<void> getProfileInformation(String userToken, String useId) async {
    // Define the API endpoint URL
    final url = Uri.parse("https://mistrichacha.com/tsit/Fsm/viewFsmProfile");

    // Create a FormData object
    final formData = http.MultipartRequest('POST', url);

    // Add your form fields and files as needed
    formData.fields.addAll({
      'user_id': "3812",
      '': '',
    });

    // Add custom headers
    final headers = <String, String>{
      'Client-Service': 'frontend-client',
      'Auth-Token': userToken,
    };
    formData.headers.addAll(headers);

    try {
      // Send the POST request
      final response = await formData.send();

      // Check the response status code
      if (response.statusCode == 200) {
        print('Request successful');
        // Handle the response data if needed
        final responseData = await response.stream.bytesToString();
        print('Response data: $responseData');
      } else {
        print('Request failed with status code ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<UpdateProfileModel> updateProfileInformation(
    String authToken,
    String fullName,
    String mobileNumber,
    String emailAddress,
    String addressText,
    String userId,
  ) async {
    var url = ApisPath().updateProfileInfo;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      request.fields['tsp_id'] = userId;
      request.fields['email'] = emailAddress;
      request.fields['name'] = fullName;
      request.fields['number'] = mobileNumber;
      request.fields['address'] = addressText;
      request.fields['country'] = "India";
      request.fields['state'] = "Maharastra";
      request.fields['city'] = "Nagpur";
      request.fields['zipcode'] = "440030";
      // int contentLength = 196;
      // print("fromApiccldlcontentLengthd $contentLength");
      Map<String, String> headers = {
        'Client-Service': 'frontend-client',
        'Auth-Token': "1f0684243e0fa74fe3e77f4e1fbf88a2",
        'Content-Type':
            "multipart/form-data; boundary=<calculated when request is sent>",
      };
      request.headers.addAll(headers);
      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        print("ApiCall ${request.fields}");
        print("updateProfileInformation ${response.body}");
        print("updateProfileInformation ${response.statusCode}");
        print("updateProfileInformation ${ApisPath().updateProfileInfo}");
        if (response.statusCode == 200) {
          return UpdateProfileModel.fromJson(jsonDecode(response.body));
        } else {
          return UpdateProfileModel.fromJson(jsonDecode(response.body));
        }
      } catch (e) {
        debugPrint("fromCatchasssssfromRegistrationApi $e");
      }
      return UpdateProfileModel();
    }
  }

  Future<GetClientListData> getClientList() async {
    var url = ApisPath().getClientListData;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      request.fields['sp_id'] = "3812";

      Map<String, String> headers = {
        'Client-Service': 'frontend-client',
        'Auth-Key': "ExVfMAc9A8vQcE3zY0",
      };
      request.headers.addAll(headers);
      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        print("ApiCall ${request.fields}");
        print("updateProfileInformation ${response.body}");
        print("updateProfileInformation ${response.statusCode}");
        print("updateProfileInformation ${ApisPath().updateProfileInfo}");
        if (response.statusCode == 200) {
          return GetClientListData.fromJson(jsonDecode(response.body));
        } else {
          return GetClientListData.fromJson(jsonDecode(response.body));
        }
      } catch (e) {
        // debugPrint("fromCatchasssssfromRegistrationApi $e");
      }
      return GetClientListData();
    }
  }

  // void addClientToDataBase() {}

  Future<AddingClient> addClientToDataBase(
      String fullName,
      String email,
      String phoneNumber,
      String addressLine,
      String country,
      String state,
      String city,
      String pinCode,
      String spId) async {
    var url = ApisPath().postAddClientToDb;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      Map<String, String> headers = {
        'Client-Service': 'frontend-client',
        'Auth-Key': 'ExVfMAc9A8vQcE3zY0',
      };
      request.fields['name'] = fullName;
      request.fields['number'] = phoneNumber;
      request.fields['email'] = email;
      request.fields['address'] = phoneNumber;
      request.fields['email'] = phoneNumber!;
      request.fields['country'] = country;
      request.fields['state'] = state;
      request.fields['city'] = city;
      request.fields['zip'] = pinCode;
      request.fields['sp_id'] = spId;
      // request.fields['sp_id'] = "3812";
      request.headers.addAll(headers);

      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        print("ApiCall ${request.fields}");
        print("fromRegistrationApi ${response.body}");
        if (response.statusCode == 200) {
          return AddingClient.fromJson(jsonDecode(response.body));
        } else {
          return AddingClient.fromJson(jsonDecode(response.body));
        }
      } catch (e) {
        debugPrint("fromCatchasssss $e");
      }
      return AddingClient();
    }
  }

  Future<LineListModel> getLineList(String userId) async {
    print("fromGeTLineListuserId $userId");
    var url = ApisPath().postGetLineList;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      // request.fields['sp_id'] = "3812";
      request.fields['sp_id'] = userId;

      Map<String, String> headers = {
        'Client-Service': 'frontend-client',
        'Auth-Key': "ExVfMAc9A8vQcE3zY0",
      };
      request.headers.addAll(headers);
      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        print("ApiCall ${request.fields}");
        print("updateProfileInformation ${response.body}");
        print("updateProfileInformation ${response.statusCode}");
        print("updateProfileInformation ${ApisPath().updateProfileInfo}");
        if (response.statusCode == 200) {
          return LineListModel.fromJson(jsonDecode(response.body));
        } else {
          return LineListModel.fromJson(jsonDecode(response.body));
        }
      } catch (e) {
        // debugPrint("fromCatchasssssfromRegistrationApi $e");
      }
      return LineListModel();
    }
  }

  Future<SaveLineListModel> saveLineList(
      String userId,
      String typeValue,
      String itemName,
      String description,
      String price,
      String quantity,
      String totalValue) async {
    print("fromGeTLineListuserId $userId");
    var url = ApisPath().postAddItemLine;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      request.fields['sp_id'] = userId;
      request.fields['type'] = typeValue;
      request.fields['name'] = itemName;
      request.fields['description'] = description;
      request.fields['price'] = price;
      request.fields['qty'] = quantity;
      request.fields['total'] = totalValue;

      Map<String, String> headers = {
        'Client-Service': 'frontend-client',
        'Auth-Key': "ExVfMAc9A8vQcE3zY0",
      };
      request.headers.addAll(headers);
      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          return SaveLineListModel.fromJson(jsonDecode(response.body));
        } else {
          return SaveLineListModel.fromJson(jsonDecode(response.body));
        }
      } catch (e) {
        // debugPrint("fromCatchasssssfromRegistrationApi $e");
      }
      return SaveLineListModel();
    }
  }

  Future<SaveLineListModel> createQuotes(
      String jobTitle,
      String instructionController,
      String clientId,
      String clientName,
      String tflPrice,
      String tflTotal,
      String clientPhone,
      String clientCity,
      String clientEmail,
      String userId,
      String tspId,
      String tflType,
      String tflName,
      String tflDescription,
      String tflQty) async {
    var url = "https://mistrichacha.com/tsit/Fsm/CreateQuote";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      request.fields['fsm_id'] = "3812";
      request.fields['client_id'] = clientId;
      request.fields['name'] = clientName;
      request.fields['email'] = clientEmail;
      request.fields['number'] = tflPrice;
      request.fields['address'] = clientCity;
      request.fields['country'] = "India";
      request.fields['state'] = "Maharastra";
      request.fields['total'] = tflTotal;
      request.fields['city'] = "Nagpur";
      request.fields['zip'] = "440030";
      request.fields['job_title'] = jobTitle;
      request.fields['line_item_id'] = "2";
      request.fields['subtotal'] = tflTotal;
      request.fields['discount_type'] = "Fixed";
      request.fields['discount_value'] = "10";
      request.fields['tax'] = "2";
      request.fields['tax_name'] = "GST";
      request.fields['tax_rate'] = "2";
      request.fields['tax_description'] = "Indian gov. Tax";
      request.fields['quote_status'] = "Drafted Quote";
      request.fields['required_deposite_type'] = "Percentage";
      request.fields['deposite_value'] = "15";
      request.fields['instruction'] = instructionController;

      Map<String, String> headers = {
        'Client-Service': 'frontend-client',
        'Auth-Key': "ExVfMAc9A8vQcE3zY0",
      };
      request.headers.addAll(headers);
      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        print("ApiCall ${request.fields}");
        print("updateProfileInformation ${response.body}");
        print("updateProfileInformation ${response.statusCode}");
        print("updateProfileInformation ${ApisPath().updateProfileInfo}");
        if (response.statusCode == 200) {
          return SaveLineListModel.fromJson(jsonDecode(response.body));
        } else {
          return SaveLineListModel.fromJson(jsonDecode(response.body));
        }
      } catch (e) {
        // debugPrint("fromCatchasssssfromRegistrationApi $e");
      }
      return SaveLineListModel();
    }
  }




  Future<QuoteList> getQuoteList() async {
    var url = ApisPath().postGetQuoteList;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    {
      request.fields['fsm_id'] = "3812";
      request.fields['quote_status'] = "";

      Map<String, String> headers = {
        'Client-Service': 'frontend-client',
        'Auth-Key': "ExVfMAc9A8vQcE3zY0",
      };
      request.headers.addAll(headers);
      try {
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        print("ApiCall ${request.fields}");
        print("getQuoteList ${response.body}");
        print("getQuoteList ${response.statusCode}");
        print("getQuoteList ${ApisPath().postGetQuoteList}");
        if (response.statusCode == 200) {
          return QuoteList.fromJson(jsonDecode(response.body));
        } else {
          return QuoteList.fromJson(jsonDecode(response.body));
        }
      } catch (e) {
        // debugPrint("fromCatchasssssfromRegistrationApi $e");
      }
      return QuoteList();
    }
  }





}
