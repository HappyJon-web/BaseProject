import 'dart:convert';

import 'package:baseproject/core/services/models/orderList_model.dart';
import 'package:baseproject/core/services/models/order_model.dart';

OrderListResponse orderListResponseFromJson(String str) =>
    OrderListResponse.fromJson(json.decode(str));

class OrderListResponse {
  OrderListResponse({
    this.status,
    this.message,
    this.data,
  });

  Order data;
  bool status;
  String message;
  factory OrderListResponse.fromJson(Map<String, dynamic> json) =>
      OrderListResponse(
          status: json["success"] == null ? false : json["success"],
          data: json["data"] == null
              ? null
              : Order.fromJson(json["data"]),
          message: json["message"] == null ? null : json["message"]);
}
