class Products {
  List<Product>? product;
  int? number;

  Products({this.product, this.number});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      product = <Product>[];
      json['items'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['items'] = this.product!.map((v) => v.toJson()).toList();
    }
    data['number'] = this.number;
    return data;
  }
}

class Product {
  int? id;
  String? name;
  int? price;
  String? code;
  String? description;
  bool? available;
  String? image;
  int? companyId;
  String? createdAt;
  String? updatedAt;
  int amount = 1;

  Product({
    this.id,
    this.name,
    this.price,
    this.code,
    this.description,
    this.available,
    this.image,
    this.companyId,
    this.createdAt,
    this.updatedAt,
    required this.amount,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    code = json['code'];
    description = json['description'];
    available = json['available'];
    image = json['image'];
    companyId = json['companyId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['code'] = this.code;
    data['description'] = this.description;
    data['available'] = this.available;
    data['image'] = this.image;
    data['companyId'] = this.companyId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
