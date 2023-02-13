// To parse this JSON data, do
//
//     final barcodeModel = barcodeModelFromJson(jsonString);

import 'dart:convert';

BarcodeModel barcodeModelFromJson(String str) =>
    BarcodeModel.fromJson(json.decode(str));

String barcodeModelToJson(BarcodeModel data) => json.encode(data.toJson());

class BarcodeModel {
  BarcodeModel({
    this.url,
    this.key,
  });

  String url;
  String key;

  factory BarcodeModel.fromJson(Map<String, dynamic> json) => BarcodeModel(
        url: json["url"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "key": key,
      };
}
