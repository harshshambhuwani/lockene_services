class OtpModel {
  String? status;
  String? message;
  int? data;
  int? otp;

  OtpModel({this.status, this.message, this.data, this.otp});

  OtpModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['message'];
    data = json['data'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = data;
    data['otp'] = otp;
    return data;
  }
}
