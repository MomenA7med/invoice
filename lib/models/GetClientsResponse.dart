class GetClientsResponse {
  int? number;
  List<Items>? items;

  GetClientsResponse({this.number, this.items});

  GetClientsResponse.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  num? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? fax;
  num? type;
  num? vat;
  String? cr;
  num? companyId;
  String? createdAt;
  String? updatedAt;

  Items(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.fax,
      this.type,
      this.vat,
      this.cr,
      this.companyId,
      this.createdAt,
      this.updatedAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    fax = json['fax'];
    type = json['type'];
    vat = json['VAT'];
    cr = json['CR'];
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
    data['VAT'] = this.vat;
    data['CR'] = this.cr;
    data['companyId'] = this.companyId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
