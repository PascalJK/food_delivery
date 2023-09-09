// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
  });

  CartModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    price = map['price'];
    img = map['img'];
    quantity = map['quantity'];
    isExist = map['isExist'];
    time = map['time'];
  }

  CartModel copyWith({
    int? id,
    String? name,
    int? price,
    String? img,
    int? quantity,
    bool? isExist,
    String? time,
  }) {
    return CartModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      img: img ?? this.img,
      quantity: quantity ?? this.quantity,
      isExist: isExist ?? this.isExist,
      time: time ?? this.time,
    );
  }
}
