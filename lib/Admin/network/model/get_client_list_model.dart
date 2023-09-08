class GetClientListData {
  String? status;
  String? message;
  List<Data>? data;

  GetClientListData({this.status, this.message, this.data});

  GetClientListData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? mfrId;
  String? spId;
  String? tcCustName;
  String? tcCustEmail;
  String? tcPhoneNumber;
  String? tcCountry;
  String? tcState;
  String? tcCity;
  String? tcPincode;
  String? tcAddress;
  String? customerGoogleAddress;
  String? countryName;
  String? stateName;
  String? cityName;

  Data(
      {this.id,
        this.mfrId,
        this.spId,
        this.tcCustName,
        this.tcCustEmail,
        this.tcPhoneNumber,
        this.tcCountry,
        this.tcState,
        this.tcCity,
        this.tcPincode,
        this.tcAddress,
        this.customerGoogleAddress,
        this.countryName,
        this.stateName,
        this.cityName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mfrId = json['mfr_id'];
    spId = json['sp_id'];
    tcCustName = json['tc_cust_name'];
    tcCustEmail = json['tc_cust_email'];
    tcPhoneNumber = json['tc_phone_number'];
    tcCountry = json['tc_country'];
    tcState = json['tc_state'];
    tcCity = json['tc_city'];
    tcPincode = json['tc_pincode'];
    tcAddress = json['tc_address'];
    customerGoogleAddress = json['customer_google_address'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mfr_id'] = this.mfrId;
    data['sp_id'] = this.spId;
    data['tc_cust_name'] = this.tcCustName;
    data['tc_cust_email'] = this.tcCustEmail;
    data['tc_phone_number'] = this.tcPhoneNumber;
    data['tc_country'] = this.tcCountry;
    data['tc_state'] = this.tcState;
    data['tc_city'] = this.tcCity;
    data['tc_pincode'] = this.tcPincode;
    data['tc_address'] = this.tcAddress;
    data['customer_google_address'] = this.customerGoogleAddress;
    data['country_name'] = this.countryName;
    data['state_name'] = this.stateName;
    data['city_name'] = this.cityName;
    return data;
  }
}
