class GetInvoicesResponse {
  List<Items>? items;
  int? number;

  GetInvoicesResponse({this.items, this.number});

  GetInvoicesResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['number'] = this.number;
    return data;
  }
}

class Items {
  int? id;
  String? title;
  String? notes;
  int? status;
  num? net;
  int? companyId;
  int? clientId;
  String? createdAt;
  String? updatedAt;
  Client? client;

  Items(
      {this.id,
      this.title,
      this.notes,
      this.status,
      this.net,
      this.companyId,
      this.clientId,
      this.createdAt,
      this.updatedAt,
      this.client});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    notes = json['notes'];
    status = json['status'];
    net = json['net'];
    companyId = json['companyId'];
    clientId = json['clientId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
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
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Client {
  num? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? fax;
  num? type;
  num? vAT;
  String? cR;
  num? companyId;
  String? createdAt;
  String? updatedAt;

  Client(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.fax,
      this.type,
      this.vAT,
      this.cR,
      this.companyId,
      this.createdAt,
      this.updatedAt});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    fax = json['fax'];
    type = json['type'];
    vAT = json['VAT'];
    cR = json['CR'];
    companyId = json['companyId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['fax'] = this.fax;
    data['type'] = this.type;
    data['VAT'] = this.vAT;
    data['CR'] = this.cR;
    data['companyId'] = this.companyId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
