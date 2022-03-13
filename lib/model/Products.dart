class Products {
  Products({
      this.data,});

  Products.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.category, 
      this.id, 
      this.products,});

  Data.fromJson(dynamic json) {
    category = json['category'];
    id = json['id'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Product.fromJson(v));
      });
    }
  }
  String? category;
  String? id;
  List<Product>? products;
  bool isSelected=false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['id'] = id;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Product {
  Product({
      this.name, 
      this.img,});

  Product.fromJson(dynamic json) {
    name = json['name'];
    img = json['img'];
  }
  String? name;
  String? img;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['img'] = img;
    return map;
  }

}