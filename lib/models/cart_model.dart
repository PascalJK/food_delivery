import 'dart:convert';

import 'product_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;
  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
    this.product,
  });

  CartModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    price = map['price'];
    img = map['img'];
    quantity = map['quantity'];
    isExist = map['isExist'];
    time = map['time'];
    product = ProductModel.fromJson(map['product']);
  }

  CartModel copyWith({
    int? id,
    String? name,
    int? price,
    String? img,
    int? quantity,
    bool? isExist,
    String? time,
    ProductModel? product,
  }) {
    return CartModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      img: img ?? this.img,
      quantity: quantity ?? this.quantity,
      isExist: isExist ?? this.isExist,
      time: time ?? this.time,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'img': img,
      'quantity': quantity,
      'isExist': isExist,
      'time': time,
      'product': product?.toJson(),
    };
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
