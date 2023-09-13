
import 'dart:convert';

List<CartModel> cartModelFromJson(String str) => List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));


String cartModelToJson(List<CartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
    final int id;
    final String comicName;
    final String image;
    final int price;
     int qty;

    CartModel({
        required this.id,
        required this.comicName,
        required this.image,
        required this.price,
        required this.qty,
    });

    CartModel copyWith({
        int? id,
        String? comicName,
        String? image,
        int? price,
        int? qty,
    }) => 
        CartModel(
            id: id ?? this.id,
            comicName: comicName ?? this.comicName,
            image: image ?? this.image,
            price: price ?? this.price,
            qty: qty ?? this.qty,
        );

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        comicName: json["comic_name"],
        image: json["image"],
        price: json["price"],
        qty: json["qty"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "comic_name": comicName,
        "image": image,
        "price": price,
        "qty": qty,
    };
}
