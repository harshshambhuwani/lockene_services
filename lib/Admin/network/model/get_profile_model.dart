class GetProfileModel {
  String? status;
  String? message;
  Data? data;

  GetProfileModel({this.status, this.message, this.data});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? tspFname;
  String? tspEmail;
  String? tspContactNumber;
  String? tspDetailedAddress;
  String? tspCountry;
  String? tspState;
  String? tspCity;
  String? tspPincode;
  String? countryName;
  String? stateName;
  String? cityName;

  Data(
      {this.id,
        this.tspFname,
        this.tspEmail,
        this.tspContactNumber,
        this.tspDetailedAddress,
        this.tspCountry,
        this.tspState,
        this.tspCity,
        this.tspPincode,
        this.countryName,
        this.stateName,
        this.cityName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tspFname = json['tsp_fname'];
    tspEmail = json['tsp_email'];
    tspContactNumber = json['tsp_contact_number'];
    tspDetailedAddress = json['tsp_detailed_address'];
    tspCountry = json['tsp_country'];
    tspState = json['tsp_state'];
    tspCity = json['tsp_city'];
    tspPincode = json['tsp_pincode'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['tsp_fname'] = tspFname;
    data['tsp_email'] = tspEmail;
    data['tsp_contact_number'] = tspContactNumber;
    data['tsp_detailed_address'] =tspDetailedAddress;
    data['tsp_country'] = tspCountry;
    data['tsp_state'] = tspState;
    data['tsp_city'] = tspCity;
    data['tsp_pincode'] = tspPincode;
    data['country_name'] = countryName;
    data['state_name'] = stateName;
    data['city_name'] = cityName;
    return data;
  }
}
