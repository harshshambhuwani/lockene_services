class OtpModel {
  String? status;
  String? message;
  dynamic data;
  int? otp;

  OtpModel({this.status, this.message, this.data, this.otp});

  OtpModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['message'];
    data = json['data'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    data['otp'] = this.otp;
    return data;
  }
}
