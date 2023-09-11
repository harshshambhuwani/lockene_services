class LineListModel {
  String? status;
  String? message;
  List<LineData>? data;

  LineListModel({this.status, this.message, this.data});

  LineListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LineData>[];
      json['data'].forEach((v) {
        data!.add(new LineData.fromJson(v));
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

class LineData {
  String? id;
  String? tspId;
  String? tflType;
  String? tflName;
  String? tflDescription;
  String? tflPrice;
  String? tflQty;
  String? tflTotal;
  String? tflCreated;
  String? tflModified;

  LineData(
      {this.id,
        this.tspId,
        this.tflType,
        this.tflName,
        this.tflDescription,
        this.tflPrice,
        this.tflQty,
        this.tflTotal,
        this.tflCreated,
        this.tflModified});

  LineData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tspId = json['tsp_id'];
    tflType = json['tfl_type'];
    tflName = json['tfl_name'];
    tflDescription = json['tfl_description'];
    tflPrice = json['tfl_price'];
    tflQty = json['tfl_qty'];
    tflTotal = json['tfl_total'];
    tflCreated = json['tfl_created'];
    tflModified = json['tfl_modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tsp_id'] = this.tspId;
    data['tfl_type'] = this.tflType;
    data['tfl_name'] = this.tflName;
    data['tfl_description'] = this.tflDescription;
    data['tfl_price'] = this.tflPrice;
    data['tfl_qty'] = this.tflQty;
    data['tfl_total'] = this.tflTotal;
    data['tfl_created'] = this.tflCreated;
    data['tfl_modified'] = this.tflModified;
    return data;
  }
}
