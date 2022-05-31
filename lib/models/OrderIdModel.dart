import 'package:invoice/models/GetClientsResponse.dart';

import 'ProductsModel.dart';

class InvoiceByIdResponse {
  int? id;
  String? title;
  String? notes;
  int? status;
  int? net;
  int? companyId;
  int? clientId;
  String? createdAt;
  String? updatedAt;
  Company? company;
  List<Product>? products;
  Items? client;

  InvoiceByIdResponse(
      {this.id,
      this.title,
      this.notes,
      this.status,
      this.net,
      this.companyId,
      this.clientId,
      this.createdAt,
      this.updatedAt,
      this.company,
      this.products,
      this.client});

  InvoiceByIdResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    notes = json['notes'];
    status = json['status'];
    net = json['net'];
    companyId = json['companyId'];
    clientId = json['clientId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(new Product.fromJson(v));
      });
    }
    client = json['client'] != null ? new Items.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['notes'] = this.notes;
    data['status'] = this.status;
    data['net'] = this.net;
    data['companyId'] = this.companyId;
    data['clientId'] = this.clientId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Company {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? createdAt;
  String? updatedAt;

  Company(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.image,
      this.createdAt,
      this.updatedAt});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
