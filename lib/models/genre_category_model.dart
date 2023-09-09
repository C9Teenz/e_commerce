
import 'dart:convert';

GenreCategoryModel genreCategoryModelFromJson(String str) => GenreCategoryModel.fromJson(json.decode(str));

String genreCategoryModelToJson(GenreCategoryModel data) => json.encode(data.toJson());

class GenreCategoryModel {
    final String name;
    final String value;

    GenreCategoryModel({
        required this.name,
        required this.value,
    });

    GenreCategoryModel copyWith({
        String? name,
        String? value,
    }) => 
        GenreCategoryModel(
            name: name ?? this.name,
            value: value ?? this.value,
        );

    factory GenreCategoryModel.fromJson(Map<String, dynamic> json) => GenreCategoryModel(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}