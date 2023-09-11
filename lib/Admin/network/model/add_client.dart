class AddingClient {
  Response? response;

  AddingClient({this.response});

  AddingClient.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  String? status;
  String? message;
  String? ismail;
  Data? data;

  Response({this.status, this.message, this.ismail, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    ismail = json['ismail'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['ismail'] = this.ismail;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? referralCode;
  String? parentReferral;
  String? timezone;
  String? abbreviation;
  String? tcCountry;
  String? tcState;
  String? tcCity;
  String? tcPincode;
  String? tcAddress;
  String? customerGoogleAddress;
  String? userWalletPoints;
  String? tcProfileImage;
  String? tcLatitude;
  String? tcLongitude;
  String? tcOtp;
  String? tcFcm;
  String? tcDeviceId;
  String? tcMakeModel;
  String? tcPlatform;
  String? tcLoginToken;
  String? tcAppVersion;
  String? tcCreatedDate;
  String? tcModifiedDate;
  String? tcIsActive;
  String? tcIsDeleted;
  String? updatedBy;

  Data(
      {this.id,
        this.mfrId,
        this.spId,
        this.tcCustName,
        this.tcCustEmail,
        this.tcPhoneNumber,
        this.referralCode,
        this.parentReferral,
        this.timezone,
        this.abbreviation,
        this.tcCountry,
        this.tcState,
        this.tcCity,
        this.tcPincode,
        this.tcAddress,
        this.customerGoogleAddress,
        this.userWalletPoints,
        this.tcProfileImage,
        this.tcLatitude,
        this.tcLongitude,
        this.tcOtp,
        this.tcFcm,
        this.tcDeviceId,
        this.tcMakeModel,
        this.tcPlatform,
        this.tcLoginToken,
        this.tcAppVersion,
        this.tcCreatedDate,
        this.tcModifiedDate,
        this.tcIsActive,
        this.tcIsDeleted,
        this.updatedBy});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mfrId = json['mfr_id'];
    spId = json['sp_id'];
    tcCustName = json['tc_cust_name'];
    tcCustEmail = json['tc_cust_email'];
    tcPhoneNumber = json['tc_phone_number'];
    referralCode = json['referral_code'];
    parentReferral = json['parent_referral'];
    timezone = json['timezone'];
    abbreviation = json['abbreviation'];
    tcCountry = json['tc_country'];
    tcState = json['tc_state'];
    tcCity = json['tc_city'];
    tcPincode = json['tc_pincode'];
    tcAddress = json['tc_address'];
    customerGoogleAddress = json['customer_google_address'];
    userWalletPoints = json['user_wallet_points'];
    tcProfileImage = json['tc_profile_image'];
    tcLatitude = json['tc_latitude'];
    tcLongitude = json['tc_longitude'];
    tcOtp = json['tc_otp'];
    tcFcm = json['tc_fcm'];
    tcDeviceId = json['tc_device_id'];
    tcMakeModel = json['tc_make_model'];
    tcPlatform = json['tc_platform'];
    tcLoginToken = json['tc_login_token'];
    tcAppVersion = json['tc_app_version'];
    tcCreatedDate = json['tc_created_date'];
    tcModifiedDate = json['tc_modified_date'];
    tcIsActive = json['tc_is_active'];
    tcIsDeleted = json['tc_is_deleted'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mfr_id'] = this.mfrId;
    data['sp_id'] = this.spId;
    data['tc_cust_name'] = this.tcCustName;
    data['tc_cust_email'] = this.tcCustEmail;
    data['tc_phone_number'] = this.tcPhoneNumber;
    data['referral_code'] = this.referralCode;
    data['parent_referral'] = this.parentReferral;
    data['timezone'] = this.timezone;
    data['abbreviation'] = this.abbreviation;
    data['tc_country'] = this.tcCountry;
    data['tc_state'] = this.tcState;
    data['tc_city'] = this.tcCity;
    data['tc_pincode'] = this.tcPincode;
    data['tc_address'] = this.tcAddress;
    data['customer_google_address'] = this.customerGoogleAddress;
    data['user_wallet_points'] = this.userWalletPoints;
    data['tc_profile_image'] = this.tcProfileImage;
    data['tc_latitude'] = this.tcLatitude;
    data['tc_longitude'] = this.tcLongitude;
    data['tc_otp'] = this.tcOtp;
    data['tc_fcm'] = this.tcFcm;
    data['tc_device_id'] = this.tcDeviceId;
    data['tc_make_model'] = this.tcMakeModel;
    data['tc_platform'] = this.tcPlatform;
    data['tc_login_token'] = this.tcLoginToken;
    data['tc_app_version'] = this.tcAppVersion;
    data['tc_created_date'] = this.tcCreatedDate;
    data['tc_modified_date'] = this.tcModifiedDate;
    data['tc_is_active'] = this.tcIsActive;
    data['tc_is_deleted'] = this.tcIsDeleted;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}
