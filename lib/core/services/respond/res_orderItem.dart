import 'dart:convert';

import 'package:baseproject/core/services/models/orderItem_model.dart';

OrderItemResponse orderItemResponseFromJson(String str) =>
    OrderItemResponse.fromJson(json.decode(str));

class OrderItemResponse {
  OrderItemResponse({
    this.status,
    this.message,
    this.data,
  });

  List<OrderItem> data;
  bool status;
  String message;
  factory OrderItemResponse.fromJson(Map<String, dynamic> json) => OrderItemResponse(
      status: json["success"] == null ? false : json["success"],
      data: json["data"] == null
          ? null
          : List<OrderItem>.from(json["data"].map((x) => OrderItem.fromJson(x))),
      message: json["message"] == null ? null : json["message"]);
}

