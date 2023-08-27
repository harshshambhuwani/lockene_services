class RegistrationModel {
  Response? response;

  RegistrationModel({this.response});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
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
  Data? data;

  Response({this.status, this.message, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Null>? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <Null>[];
      // json['user'].forEach((v) {
      //   user!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.user != null) {
    //   data['user'] = this.user!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}