class OtpModel {
  dynamic status;
  dynamic message;
  dynamic data;
  dynamic otp;

  OtpModel({this.status, this.message, this.data, this.otp});

  OtpModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['message'];
    data = json['data'];
    otp = json['otp'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['Status'] = status;
    data['message'] = message;
    data['data'] = data;
    data['otp'] = otp;
    return data;
  }
}
