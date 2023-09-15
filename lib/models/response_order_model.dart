// To parse this JSON data, do
//
//     final responseOrderModel = responseOrderModelFromJson(jsonString);

import 'package:e_commerce_comic/models/cartmodel.dart';
import 'dart:convert';

ResponseOrderModel responseOrderModelFromJson(String str) =>
    ResponseOrderModel.fromJson(json.decode(str));

String responseOrderModelToJson(ResponseOrderModel data) =>
    json.encode(data.toJson());

class ResponseOrderModel {
  final List<ResponseOrder> data;

  ResponseOrderModel({
    required this.data,
  });

  ResponseOrderModel copyWith({
    List<ResponseOrder>? data,
  }) =>
      ResponseOrderModel(
        data: data ?? this.data,
      );

  factory ResponseOrderModel.fromJson(Map<String, dynamic> json) =>
      ResponseOrderModel(
        data: List<ResponseOrder>.from(
            json["data"].map((x) => ResponseOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ResponseOrder {
  final int id;
  final DatumAttributes attributes;

  ResponseOrder({
    required this.id,
    required this.attributes,
  });

  ResponseOrder copyWith({
    int? id,
    DatumAttributes? attributes,
  }) =>
      ResponseOrder(
        id: id ?? this.id,
        attributes: attributes ?? this.attributes,
      );

  factory ResponseOrder.fromJson(Map<String, dynamic> json) => ResponseOrder(
        id: json["id"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class DatumAttributes {
  final List<CartModel> items;
  final int totalPrice;
  final String destinationAddress;
  final String courier;
  final int shippingCost;
  final String statusOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final User user;

  DatumAttributes({
    required this.items,
    required this.totalPrice,
    required this.destinationAddress,
    required this.courier,
    required this.shippingCost,
    required this.statusOrder,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.user,
  });

  DatumAttributes copyWith({
    List<CartModel>? items,
    int? totalPrice,
    String? destinationAddress,
    String? courier,
    int? shippingCost,
    String? statusOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
    User? user,
  }) =>
      DatumAttributes(
        items: items ?? this.items,
        totalPrice: totalPrice ?? this.totalPrice,
        destinationAddress: destinationAddress ?? this.destinationAddress,
        courier: courier ?? this.courier,
        shippingCost: shippingCost ?? this.shippingCost,
        statusOrder: statusOrder ?? this.statusOrder,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        publishedAt: publishedAt ?? this.publishedAt,
        user: user ?? this.user,
      );

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        items: List<CartModel>.from(
            json["items"].map((x) => CartModel.fromJson(x))),
        totalPrice: json["totalPrice"] ?? 0,
        destinationAddress: json["destinationAddress"],
        courier: json["courier"],
        shippingCost: json["shippingCost"],
        statusOrder: json["statusOrder"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "destinationAddress": destinationAddress,
        "courier": courier,
        "shippingCost": shippingCost,
        "statusOrder": statusOrder,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  final Data data;

  User({
    required this.data,
  });

  User copyWith({
    Data? data,
  }) =>
      User(
        data: data ?? this.data,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final int id;
  final DataAttributes attributes;

  Data({
    required this.id,
    required this.attributes,
  });

  Data copyWith({
    int? id,
    DataAttributes? attributes,
  }) =>
      Data(
        id: id ?? this.id,
        attributes: attributes ?? this.attributes,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: DataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class DataAttributes {
  final String username;

  DataAttributes({
    required this.username,
  });

  DataAttributes copyWith({
    String? username,
  }) =>
      DataAttributes(
        username: username ?? this.username,
      );

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
