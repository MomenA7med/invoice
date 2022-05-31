class UserModel {
  String? image;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  Company? company;


  UserModel({
    required this.image,
    required this.id,
    required this.firstName,
    required this.email,
    required this.phone,
    required this.lastName,
    required this.company
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.email = json['email'];
    this.phone = json['phone'];
    this.image = json['image'];
    this.company = Company.fromJson(json['company']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['firstName'] = this.firstName;
    json['lastName'] = this.lastName;
    json['email'] = this.email;
    json['phone'] = this.phone;
    json['image'] = this.image;
    json['company'] = this.company!.toJson();
    return json;
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

  Company.fromJson(Map<String, dynamic> json){
    this.id = json['id'];
    this.name = json['name'];
    this.email = json['email'];
    this.phone = json['phone'];
    this.image = json['image'];
    this.createdAt = json['createdAt'];
    this.updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = this.id;
    json['name'] = this.name;
    json['email'] = this.email;
    json['phone'] = this.phone;
    json['image'] = this.image;
    json['createdAt'] = this.createdAt;
    json['updatedAt'] = this.updatedAt;
    return json;
  }
}
