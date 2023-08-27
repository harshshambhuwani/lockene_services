class CountryModel {
  String? status;
  String? message;
  String? conviniencePercentage;
  String? gstPercentage;
  List<Data>? data;

  CountryModel(
      {this.status,
        this.message,
        this.conviniencePercentage,
        this.gstPercentage,
        this.data});

  CountryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    conviniencePercentage = json['convinience_percentage'];
    gstPercentage = json['gst_percentage'];
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
    data['convinience_percentage'] = this.conviniencePercentage;
    data['gst_percentage'] = this.gstPercentage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? currencySymbol;
  String? currencyName;
  String? phonecode;

  Data(
      {this.id,
        this.name,
        this.currencySymbol,
        this.currencyName,
        this.phonecode});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    currencySymbol = json['currency_symbol'];
    currencyName = json['currency_name'];
    phonecode = json['phonecode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['currency_symbol'] = this.currencySymbol;
    data['currency_name'] = this.currencyName;
    data['phonecode'] = this.phonecode;
    return data;
  }
}
