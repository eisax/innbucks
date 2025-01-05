// To parse this JSON data, do
//
//     final top12ProductResponse = top12ProductResponseFromJson(jsonString);

import 'dart:convert';

Top12ProductResponse top12ProductResponseFromJson(String str) =>
    Top12ProductResponse.fromJson(json.decode(str));

String top12ProductResponseToJson(Top12ProductResponse data) =>
    json.encode(data.toJson());

class Top12ProductResponse {
  Top12ProductResponse({
    this.data,
  });

  List<ProductOfTop>? data;

  factory Top12ProductResponse.fromJson(Map<String, dynamic> json) =>
      Top12ProductResponse(
        data: List<ProductOfTop>.from(
            json["data"].map((x) => ProductOfTop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductOfTop {
  ProductOfTop({
    this.id,
    this.name,
    this.thumbnailImg,
    this.price,
    this.currentStock,
    this.status,
    this.category,
    this.featured,
  });

  int? id;
  String? name;
  String? thumbnailImg;
  String? price;
  var currentStock;
  bool? status;
  String? category;
  bool? featured;

  factory ProductOfTop.fromJson(Map<String, dynamic> json) => ProductOfTop(
        id: json["id"],
        name: json["name"],
        thumbnailImg: json["thumbnail_img"],
        price: json["price"],
        currentStock: json["current_stock"],
        status: json["status"],
        category: json["category"],
        featured: json["featured"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail_img": thumbnailImg,
        "price": price,
        "current_stock": currentStock,
        "status": status,
        "category": category,
        "featured": featured,
      };
}
