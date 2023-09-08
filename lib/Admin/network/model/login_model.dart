class LoginModel {
  LoginResponse? response;

  LoginModel({this.response});

  LoginModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ?  LoginResponse.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class LoginResponse {
  String? status;
  String? message;
  String? conviniencePercentage;
  String? gstPercentage;
  Data? data;

  LoginResponse(
      {this.status,
        this.message,
        this.conviniencePercentage,
        this.gstPercentage,
        this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    conviniencePercentage = json['convinience_percentage'];
    gstPercentage = json['gst_percentage'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['convinience_percentage'] = this.conviniencePercentage;
    data['gst_percentage'] = this.gstPercentage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<User>? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? id;
  String? mfrId;
  String? tspReferralCode;
  String? tspReferralId;
  String? tspFname;
  String? tspLname;
  String? tspContactNumber;
  String? tspPassword;
  String? tspBusinessName;
  String? tspEmail;
  String? tspDetailedAddress;
  String? tspProfileImage;
  String? tspOtp;
  String? tspTimezone;
  String? tspAbbreviation;
  String? tspCountry;
  String? tspState;
  String? tspCity;
  String? tspPincode;
  String? tspPartnerType;
  String? tspPartnerAuthority;
  String? tspAvgRating;
  String? tspVisitingCharge;
  String? tspBankId;
  String? tspAccountName;
  String? tspIfscCode;
  String? tspAccountNumber;
  String? tspFcm;
  String? tspDeviceId;
  String? tspMakeModel;
  String? tspPlatform;
  String? tspLoginToken;
  String? tspAppVersion;
  String? tspCreatedDate;
  String? tspModifiedDate;
  String? tspSmsOfApproval;
  String? tspIsActive;
  String? tspIsApproved;
  String? tspIsDeleted;
  String? gstDetails;
  String? totalReferralEarnings;
  String? totalDue;
  String? totalReceived;
  String? tspGoogleAddress;
  String? tspLatitude;
  String? tspLongitude;
  String? isVerified;
  String? isAlertSent;
  String? updatedBy;
  String? assignWork;
  String? amcSupport;
  String? spPanNumber;
  String? zipFrom;
  String? zipTo;
  String? mfrName;
  String? currencySymbol;
  String? currencyName;
  String? countryName;
  String? stateName;
  String? cityName;
  Null? tbBankName;
  String? conviniencePercentage;
  String? gstPercentage;

  User(
      {this.id,
        this.mfrId,
        this.tspReferralCode,
        this.tspReferralId,
        this.tspFname,
        this.tspLname,
        this.tspContactNumber,
        this.tspPassword,
        this.tspBusinessName,
        this.tspEmail,
        this.tspDetailedAddress,
        this.tspProfileImage,
        this.tspOtp,
        this.tspTimezone,
        this.tspAbbreviation,
        this.tspCountry,
        this.tspState,
        this.tspCity,
        this.tspPincode,
        this.tspPartnerType,
        this.tspPartnerAuthority,
        this.tspAvgRating,
        this.tspVisitingCharge,
        this.tspBankId,
        this.tspAccountName,
        this.tspIfscCode,
        this.tspAccountNumber,
        this.tspFcm,
        this.tspDeviceId,
        this.tspMakeModel,
        this.tspPlatform,
        this.tspLoginToken,
        this.tspAppVersion,
        this.tspCreatedDate,
        this.tspModifiedDate,
        this.tspSmsOfApproval,
        this.tspIsActive,
        this.tspIsApproved,
        this.tspIsDeleted,
        this.gstDetails,
        this.totalReferralEarnings,
        this.totalDue,
        this.totalReceived,
        this.tspGoogleAddress,
        this.tspLatitude,
        this.tspLongitude,
        this.isVerified,
        this.isAlertSent,
        this.updatedBy,
        this.assignWork,
        this.amcSupport,
        this.spPanNumber,
        this.zipFrom,
        this.zipTo,
        this.mfrName,
        this.currencySymbol,
        this.currencyName,
        this.countryName,
        this.stateName,
        this.cityName,
        this.tbBankName,
        this.conviniencePercentage,
        this.gstPercentage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mfrId = json['mfr_id'];
    tspReferralCode = json['tsp_referral_code'];
    tspReferralId = json['tsp_referral_id'];
    tspFname = json['tsp_fname'];
    tspLname = json['tsp_lname'];
    tspContactNumber = json['tsp_contact_number'];
    tspPassword = json['tsp_password'];
    tspBusinessName = json['tsp_business_name'];
    tspEmail = json['tsp_email'];
    tspDetailedAddress = json['tsp_detailed_address'];
    tspProfileImage = json['tsp_profile_image'];
    tspOtp = json['tsp_otp'];
    tspTimezone = json['tsp_timezone'];
    tspAbbreviation = json['tsp_abbreviation'];
    tspCountry = json['tsp_country'];
    tspState = json['tsp_state'];
    tspCity = json['tsp_city'];
    tspPincode = json['tsp_pincode'];
    tspPartnerType = json['tsp_partner_type'];
    tspPartnerAuthority = json['tsp_partner_authority'];
    tspAvgRating = json['tsp_avg_rating'];
    tspVisitingCharge = json['tsp_visiting_charge'];
    tspBankId = json['tsp_bank_id'];
    tspAccountName = json['tsp_account_name'];
    tspIfscCode = json['tsp_ifsc_code'];
    tspAccountNumber = json['tsp_account_number'];
    tspFcm = json['tsp_fcm'];
    tspDeviceId = json['tsp_device_id'];
    tspMakeModel = json['tsp_make_model'];
    tspPlatform = json['tsp_platform'];
    tspLoginToken = json['tsp_login_token'];
    tspAppVersion = json['tsp_app_version'];
    tspCreatedDate = json['tsp_created_date'];
    tspModifiedDate = json['tsp_modified_date'];
    tspSmsOfApproval = json['tsp_sms_of_approval'];
    tspIsActive = json['tsp_is_active'];
    tspIsApproved = json['tsp_is_approved'];
    tspIsDeleted = json['tsp_is_deleted'];
    gstDetails = json['gst_details'];
    totalReferralEarnings = json['total_referral_earnings'];
    totalDue = json['total_due'];
    totalReceived = json['total_received'];
    tspGoogleAddress = json['tsp_google_address'];
    tspLatitude = json['tsp_latitude'];
    tspLongitude = json['tsp_longitude'];
    isVerified = json['is_verified'];
    isAlertSent = json['is_alert_sent'];
    updatedBy = json['updated_by'];
    assignWork = json['assign_work'];
    amcSupport = json['amc_support'];
    spPanNumber = json['sp_pan_number'];
    zipFrom = json['zip_from'];
    zipTo = json['zip_to'];
    mfrName = json['mfr_name'];
    currencySymbol = json['currency_symbol'];
    currencyName = json['currency_name'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    tbBankName = json['tb_bank_name'];
    conviniencePercentage = json['convinience_percentage'];
    gstPercentage = json['gst_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mfr_id'] = mfrId;
    data['tsp_referral_code'] = tspReferralCode;
    data['tsp_referral_id'] = tspReferralId;
    data['tsp_fname'] = tspFname;
    data['tsp_lname'] = tspLname;
    data['tsp_contact_number'] = tspContactNumber;
    data['tsp_password'] = tspPassword;
    data['tsp_business_name'] = tspBusinessName;
    data['tsp_email'] = tspEmail;
    data['tsp_detailed_address'] = tspDetailedAddress;
    data['tsp_profile_image'] = tspProfileImage;
    data['tsp_otp'] = tspOtp;
    data['tsp_timezone'] = tspTimezone;
    data['tsp_abbreviation'] = tspAbbreviation;
    data['tsp_country'] = tspCountry;
    data['tsp_state'] = tspState;
    data['tsp_city'] = tspCity;
    data['tsp_pincode'] = tspPincode;
    data['tsp_partner_type'] = tspPartnerType;
    data['tsp_partner_authority'] = tspPartnerAuthority;
    data['tsp_avg_rating'] = tspAvgRating;
    data['tsp_visiting_charge'] = tspVisitingCharge;
    data['tsp_bank_id'] = tspBankId;
    data['tsp_account_name'] = tspAccountName;
    data['tsp_ifsc_code'] = tspIfscCode;
    data['tsp_account_number'] = tspAccountNumber;
    data['tsp_fcm'] = tspFcm;
    data['tsp_device_id'] = tspDeviceId;
    data['tsp_make_model'] = tspMakeModel;
    data['tsp_platform'] = tspPlatform;
    data['tsp_login_token'] = tspLoginToken;
    data['tsp_app_version'] = tspAppVersion;
    data['tsp_created_date'] = tspCreatedDate;
    data['tsp_modified_date'] = tspModifiedDate;
    data['tsp_sms_of_approval'] = tspSmsOfApproval;
    data['tsp_is_active'] = tspIsActive;
    data['tsp_is_approved'] = tspIsApproved;
    data['tsp_is_deleted'] = tspIsDeleted;
    data['gst_details'] = gstDetails;
    data['total_referral_earnings'] = totalReferralEarnings;
    data['total_due'] = totalDue;
    data['total_received'] = totalReceived;
    data['tsp_google_address'] = tspGoogleAddress;
    data['tsp_latitude'] = tspLatitude;
    data['tsp_longitude'] = tspLongitude;
    data['is_verified'] = isVerified;
    data['is_alert_sent'] = isAlertSent;
    data['updated_by'] = updatedBy;
    data['assign_work'] = assignWork;
    data['amc_support'] = amcSupport;
    data['sp_pan_number'] = spPanNumber;
    data['zip_from'] = zipFrom;
    data['zip_to'] = zipTo;
    data['mfr_name'] = mfrName;
    data['currency_symbol'] = currencySymbol;
    data['currency_name'] = currencyName;
    data['country_name'] = countryName;
    data['state_name'] = stateName;
    data['city_name'] = cityName;
    data['tb_bank_name'] = tbBankName;
    data['convinience_percentage'] = conviniencePercentage;
    data['gst_percentage'] = gstPercentage;
    return data;
  }
}
