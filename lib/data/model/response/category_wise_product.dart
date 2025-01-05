// To parse this JSON data, do
//
//     final CategoryWiseProductResponse = CategoryWiseProductResponseFromJson(jsonString);

import 'dart:convert';

List<CategoryWiseProductResponse> categoryWiseProductResponseFromJson(String str) => List<CategoryWiseProductResponse>.from(json.decode(str).map((x) => CategoryWiseProductResponse.fromJson(x)));

String categoryWiseProductResponseToJson(List<CategoryWiseProductResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryWiseProductResponse {
  CategoryWiseProductResponse({
    this.name,
    this.cntProduct,
    this.banner,
  });

  String? name;
  int? cntProduct;
  String? banner;

  factory CategoryWiseProductResponse.fromJson(Map<String, dynamic> json) => CategoryWiseProductResponse(
    name: json["name"],
    cntProduct: json["cnt_product"],
    banner: json["banner"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "cnt_product": cntProduct,
    "banner": banner,
  };
}
