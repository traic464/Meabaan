// To parse this JSON data, do
//
//     final productAll = productAllFromJson(jsonString);

import 'dart:convert';

List<ProductAll> productAllFromJson(String str) => List<ProductAll>.from(json.decode(str).map((x) => ProductAll.fromJson(x)));

String productAllToJson(List<ProductAll> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductAll {
    ProductAll({
        required this.productId,
        required this.productName,
        required this.categoryName,
        required this.sellType,
    });

    String? productId;
    String? productName;
    String? categoryName;
    String? sellType;

    factory ProductAll.fromJson(Map<String, dynamic> json) => ProductAll(
        productId: json["product_id"] == null ? null : json["product_id"],
        productName: json["product_name"] == null ? null : json["product_name"],
        categoryName: json["category_name"] == null ? null : json["category_name"],
        sellType: json["sell_type"] == null ? null : json["sell_type"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "product_name": productName == null ? null : productName,
        "category_name": categoryName == null ? null : categoryName,
        "sell_type": sellType == null ? null : sellType,
    };
}

// enum CategoryName { EMPTY, CATEGORY_NAME, PURPLE, FLUFFY, TENTACLED, STICKY, INDIGO, INDECENT, HILARIOUS, AMBITIOUS, CUNNING, MAGENTA }

// final categoryNameValues = EnumValues({
//     "ราคาขายปลีกข้าวสาร": CategoryName.AMBITIOUS,
//     "สัตว์น้ำ": CategoryName.CATEGORY_NAME,
//     "พืชไร่": CategoryName.CUNNING,
//     "เนื้อสัตว์": CategoryName.EMPTY,
//     "ผัก-ผลไม้อินทรีย์": CategoryName.FLUFFY,
//     "ราคาขายส่งข้าวสารให้ร้านขายปลีก": CategoryName.HILARIOUS,
//     "ราคาขายส่งข้าว ผลิตภัณฑ์ข้าวและกระสอบป่าน": CategoryName.INDECENT,
//     "พืชน้ำมันและน้ำมันพืช": CategoryName.INDIGO,
//     "อาหารสัตว์และวัตถุดิบอาหารสัตว์": CategoryName.MAGENTA,
//     "ผักสด": CategoryName.PURPLE,
//     "พืชอาหาร": CategoryName.STICKY,
//     "ผลไม้": CategoryName.TENTACLED
// });

// enum SellType { EMPTY, SELL_TYPE }

// final sellTypeValues = EnumValues({
//     "ขายปลีก": SellType.EMPTY,
//     "ขายส่ง": SellType.SELL_TYPE
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
