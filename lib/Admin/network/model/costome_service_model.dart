class CostomeServiceModel {
  String? status;
  String? message;
  List<ServiceData>? data;

  CostomeServiceModel({this.status, this.message, this.data});

  CostomeServiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ServiceData>[];
      json['data'].forEach((v) {
        data!.add(new ServiceData.fromJson(v));
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

class ServiceData {
  String? customServiceId;
  String? customService;
  String? icon;
  String? createdBy;
  String? updatedBy;
  String? createdDate;
  String? modifiedDate;
  String? type;
  String? isActive;
  String? isDeleted;

  ServiceData(
      {this.customServiceId,
        this.customService,
        this.icon,
        this.createdBy,
        this.updatedBy,
        this.createdDate,
        this.modifiedDate,
        this.type,
        this.isActive,
        this.isDeleted});

  ServiceData.fromJson(Map<String, dynamic> json) {
    customServiceId = json['custom_service_id'];
    customService = json['custom_service'];
    icon = json['icon'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    type = json['type'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custom_service_id'] = this.customServiceId;
    data['custom_service'] = this.customService;
    data['icon'] = this.icon;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_date'] = this.createdDate;
    data['modified_date'] = this.modifiedDate;
    data['type'] = this.type;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    return data;
  }
}
