class QuoteList {
  String? status;
  String? message;
  List<QuoteData>? data;

  QuoteList({this.status, this.message, this.data});

  QuoteList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <QuoteData>[];
      json['data'].forEach((v) {
        data!.add(new QuoteData.fromJson(v));
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

class QuoteData {
  String? id;
  String? tbFsmId;
  String? tbClientId;
  String? tbClientName;
  String? quoteNumber;
  String? tbAddress;
  String? tbJobTitle;
  String? total;
  String? cityName;
  String? tqsStatus;
  String? tbCreated;

  QuoteData(
      {this.id,
        this.tbFsmId,
        this.tbClientId,
        this.tbClientName,
        this.quoteNumber,
        this.tbAddress,
        this.tbJobTitle,
        this.total,
        this.cityName,
        this.tqsStatus,
        this.tbCreated});

  QuoteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tbFsmId = json['tb_fsm_id'];
    tbClientId = json['tb_client_id'];
    tbClientName = json['tb_client_name'];
    quoteNumber = json['quote_number'];
    tbAddress = json['tb_address'];
    tbJobTitle = json['tb_job_title'];
    total = json['total'];
    cityName = json['city_name'];
    tqsStatus = json['tqs_status'];
    tbCreated = json['tb_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tb_fsm_id'] = this.tbFsmId;
    data['tb_client_id'] = this.tbClientId;
    data['tb_client_name'] = this.tbClientName;
    data['quote_number'] = this.quoteNumber;
    data['tb_address'] = this.tbAddress;
    data['tb_job_title'] = this.tbJobTitle;
    data['total'] = this.total;
    data['city_name'] = this.cityName;
    data['tqs_status'] = this.tqsStatus;
    data['tb_created'] = this.tbCreated;
    return data;
  }
}
