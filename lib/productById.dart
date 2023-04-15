// To parse this JSON data, do
//
//     final productById = productByIdFromJson(jsonString);

import 'dart:convert';

ProductById productByIdFromJson(String str) => ProductById.fromJson(json.decode(str));

String productByIdToJson(ProductById data) => json.encode(data.toJson());

class ProductById {
    ProductById({
        required this.productId,
        required this.productName,
        required this.productDescEn,
        required this.productDescTh,
        required this.categoryName,
        required this.groupName,
        required this.unit,
        required this.priceMinAvg,
        required this.priceMaxAvg,
        required this.priceList,
    });

    String? productId;
    String? productName;
    String? productDescEn;
    String? productDescTh;
    String? categoryName;
    String? groupName;
    String? unit;
    double? priceMinAvg;
    double? priceMaxAvg;
    List<PriceList> priceList;

    factory ProductById.fromJson(Map<String, dynamic> json) => ProductById(
        productId: json["product_id"] == null ? null : json["product_id"],
        productName: json["product_name"] == null ? null : json["product_name"],
        productDescEn: json["product_desc_en"] == null ? null : json["product_desc_en"],
        productDescTh: json["product_desc_th"] == null ? null : json["product_desc_th"],
        categoryName: json["category_name"] == null ? null : json["category_name"],
        groupName: json["group_name"] == null ? null : json["group_name"],
        unit: json["unit"] == null ? null : json["unit"],
        priceMinAvg: json["price_min_avg"] == null ? null : json["price_min_avg"],
        priceMaxAvg: json["price_max_avg"] == null ? null : json["price_max_avg"],
        priceList: List<PriceList>.from(json["price_list"].map((x) => PriceList.fromJson(x))), 
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "product_name": productName == null ? null : productName,
        "product_desc_en": productDescEn == null ? null : productDescEn,
        "product_desc_th": productDescTh == null ? null : productDescTh,
        "category_name": categoryName == null ? null : categoryName,
        "group_name": groupName == null ? null : groupName,
        "unit": unit == null ? null : unit,
        "price_min_avg": priceMinAvg == null ? null : priceMinAvg,
        "price_max_avg": priceMaxAvg == null ? null : priceMaxAvg,
        "price_list": priceList == null ? null : List<dynamic>.from(priceList.map((x) => x.toJson())),
    };
}

class PriceList {
    PriceList({
        required this.date,
        required this.priceMin,
        required this.priceMax,
    });

    DateTime date;
    double priceMin;
    double priceMax;

    factory PriceList.fromJson(Map<String, dynamic> json) => PriceList(
        date: DateTime.parse(json["date"]),
        priceMin: json["price_min"] == null ? null : json["price_min"],
        priceMax: json["price_max"] == null ? null : json["price_max"],
    );

    Map<String, dynamic> toJson() => {
        "date": date == null ? null : date.toIso8601String(),
        "price_min": priceMin == null ? null : priceMin,
        "price_max": priceMax == null ? null : priceMax,
    };
}
