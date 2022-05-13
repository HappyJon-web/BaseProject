import 'dart:convert';

import 'package:baseproject/core/services/models/order_model.dart';

OrderResponse orderResponseFromJson(String str) =>
    OrderResponse.fromJson(json.decode(str));

class OrderResponse {
  OrderResponse({
    this.status,
    this.message,
    this.data,
  });

  List<Order> data;
  bool status;
  String message;
  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
      status: json["success"] == null ? false : json["success"],
      data: json["data"] == null
          ? null
          : List<Order>.from(json["data"].map((x) => Order.fromJson(x))),
      message: json["message"] == null ? null : json["message"]);
}
