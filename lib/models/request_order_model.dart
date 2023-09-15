// To parse this JSON data, do
//
//     final requestOrderModel = requestOrderModelFromJson(jsonString);

import 'package:e_commerce_comic/models/cartmodel.dart';
import 'dart:convert';

RequestOrderModel requestOrderModelFromJson(String str) => RequestOrderModel.fromJson(json.decode(str));

String requestOrderModelToJson(RequestOrderModel data) => json.encode(data.toJson());

class RequestOrderModel {
    final Data data;

    RequestOrderModel({
        required this.data,
    });

    RequestOrderModel copyWith({
        Data? data,
    }) => 
        RequestOrderModel(
            data: data ?? this.data,
        );

    factory RequestOrderModel.fromJson(Map<String, dynamic> json) => RequestOrderModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    final List<CartModel> items;
    final int totalPrice;
    final String destinationAddress;
    final String courier;
    final int shippingCost;
    final int user;
    final String statusOrder;

    Data({
        required this.items,
        required this.totalPrice,
        required this.destinationAddress,
        required this.courier,
        required this.shippingCost,
        required this.user,
        required this.statusOrder,
    });

    Data copyWith({
        List<CartModel>? items,
        int? totalPrice,
        String? destinationAddress,
        String? courier,
        int? shippingCost,
        int? user,
        String? statusOrder,
    }) => 
        Data(
            items: items ?? this.items,
            totalPrice: totalPrice ?? this.totalPrice,
            destinationAddress: destinationAddress ?? this.destinationAddress,
            courier: courier ?? this.courier,
            shippingCost: shippingCost ?? this.shippingCost,
            user: user ?? this.user,
            statusOrder: statusOrder ?? this.statusOrder,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: List<CartModel>.from(json["items"].map((x) => CartModel.fromJson(x))),
        totalPrice: json["totalPrice"],
        destinationAddress: json["destinationAddress"],
        courier: json["courier"],
        shippingCost: json["shippingCost"],
        user: json["user"],
        statusOrder: json["statusOrder"],
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "destinationAddress": destinationAddress,
        "courier": courier,
        "shippingCost": shippingCost,
        "user": user,
        "statusOrder": statusOrder,
    };
}


