// To parse this JSON data, do
//
//     final comicModel = comicModelFromJson(jsonString);


import 'dart:convert';

ComicModel comicModelFromJson(String str) => ComicModel.fromJson(json.decode(str));

String comicModelToJson(ComicModel data) => json.encode(data.toJson());

class ComicModel {
    final List<ComicModelDatum> data;
    final Meta meta;

    ComicModel({
        required this.data,
        required this.meta,
    });

    ComicModel copyWith({
        List<ComicModelDatum>? data,
        Meta? meta,
    }) => 
        ComicModel(
            data: data ?? this.data,
            meta: meta ?? this.meta,
        );

    factory ComicModel.fromJson(Map<String, dynamic> json) => ComicModel(
        data: List<ComicModelDatum>.from(json["data"].map((x) => ComicModelDatum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class ComicModelDatum {
    final int id;
    final PurpleAttributes attributes;

    ComicModelDatum({
        required this.id,
        required this.attributes,
    });

    ComicModelDatum copyWith({
        int? id,
        PurpleAttributes? attributes,
    }) => 
        ComicModelDatum(
            id: id ?? this.id,
            attributes: attributes ?? this.attributes,
        );

    factory ComicModelDatum.fromJson(Map<String, dynamic> json) => ComicModelDatum(
        id: json["id"],
        attributes: PurpleAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class PurpleAttributes {
    final String comicName;
    final String description;
    final int quantity;
    final bool isAvailable;
    final String price;
    final DateTime createdAt;
    final DateTime updatedAt;
    final DateTime publishedAt;
    final Author author;
    final Genres genres;
    final Images images;

    PurpleAttributes({
        required this.comicName,
        required this.description,
        required this.quantity,
        required this.isAvailable,
        required this.price,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.author,
        required this.genres,
        required this.images,
    });

    PurpleAttributes copyWith({
        String? comicName,
        String? description,
        int? quantity,
        bool? isAvailable,
        String? price,
        DateTime? createdAt,
        DateTime? updatedAt,
        DateTime? publishedAt,
        Author? author,
        Genres? genres,
        Images? images,
    }) => 
        PurpleAttributes(
            comicName: comicName ?? this.comicName,
            description: description ?? this.description,
            quantity: quantity ?? this.quantity,
            isAvailable: isAvailable ?? this.isAvailable,
            price: price ?? this.price,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            publishedAt: publishedAt ?? this.publishedAt,
            author: author ?? this.author,
            genres: genres ?? this.genres,
            images: images ?? this.images,
        );

    factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
        comicName: json["comic_name"],
        description: json["description"],
        quantity: json["quantity"],
        isAvailable: json["isAvailable"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        author: Author.fromJson(json["author"]),
        genres: Genres.fromJson(json["genres"]),
        images: Images.fromJson(json["images"]),
    );

    Map<String, dynamic> toJson() => {
        "comic_name": comicName,
        "description": description,
        "quantity": quantity,
        "isAvailable": isAvailable,
        "price": price,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "author": author.toJson(),
        "genres": genres.toJson(),
        "images": images.toJson(),
    };
}

class Author {
    final Dat data;

    Author({
        required this.data,
    });

    Author copyWith({
        Dat? data,
    }) => 
        Author(
            data: data ?? this.data,
        );

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        data: Dat.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Dat {
    final int id;
    final DataAttributes attributes;

    Dat({
        required this.id,
        required this.attributes,
    });

    Dat copyWith({
        int? id,
        DataAttributes? attributes,
    }) => 
        Dat(
            id: id ?? this.id,
            attributes: attributes ?? this.attributes,
        );

    factory Dat.fromJson(Map<String, dynamic> json) => Dat(
        id: json["id"],
        attributes: DataAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class DataAttributes {
    final String name;

    DataAttributes({
        required this.name,
    });

    DataAttributes copyWith({
        String? name,
    }) => 
        DataAttributes(
            name: name ?? this.name,
        );

    factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class Genres {
    final List<Dat> data;

    Genres({
        required this.data,
    });

    Genres copyWith({
        List<Dat>? data,
    }) => 
        Genres(
            data: data ?? this.data,
        );

    factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        data: List<Dat>.from(json["data"].map((x) => Dat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Images {
    final List<ImagesDatum> data;

    Images({
        required this.data,
    });

    Images copyWith({
        List<ImagesDatum>? data,
    }) => 
        Images(
            data: data ?? this.data,
        );

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        data: List<ImagesDatum>.from(json["data"].map((x) => ImagesDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ImagesDatum {
    final int id;
    final FluffyAttributes attributes;

    ImagesDatum({
        required this.id,
        required this.attributes,
    });

    ImagesDatum copyWith({
        int? id,
        FluffyAttributes? attributes,
    }) => 
        ImagesDatum(
            id: id ?? this.id,
            attributes: attributes ?? this.attributes,
        );

    factory ImagesDatum.fromJson(Map<String, dynamic> json) => ImagesDatum(
        id: json["id"],
        attributes: FluffyAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class FluffyAttributes {
    final String url;

    FluffyAttributes({
        required this.url,
    });

    FluffyAttributes copyWith({
        String? url,
    }) => 
        FluffyAttributes(
            url: url ?? this.url,
        );

    factory FluffyAttributes.fromJson(Map<String, dynamic> json) => FluffyAttributes(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}

class Meta {
    final Pagination pagination;

    Meta({
        required this.pagination,
    });

    Meta copyWith({
        Pagination? pagination,
    }) => 
        Meta(
            pagination: pagination ?? this.pagination,
        );

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
    };
}

class Pagination {
    final int page;
    final int pageSize;
    final int pageCount;
    final int total;

    Pagination({
        required this.page,
        required this.pageSize,
        required this.pageCount,
        required this.total,
    });

    Pagination copyWith({
        int? page,
        int? pageSize,
        int? pageCount,
        int? total,
    }) => 
        Pagination(
            page: page ?? this.page,
            pageSize: pageSize ?? this.pageSize,
            pageCount: pageCount ?? this.pageCount,
            total: total ?? this.total,
        );

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
    };
}
