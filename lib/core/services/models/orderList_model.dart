import 'package:baseproject/core/services/models/orderItem_model.dart';

class OrderList {
  int id;
  String date;
  String shift;
  String order_type;
  String order_code;
  int pendingCount;
  List<OrderItem> productList;

  OrderList(
      {this.id,
      this.date,
      this.shift,
      this.order_type,
      this.order_code,
      this.pendingCount,
      this.productList});

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        date: json["date"] == null ? null : json["date"],
        id: json["id"] == null ? null : json["id"],
        shift: json["shift"] == null ? null : json["shift"],
        order_type: json["order_type"] == null ? null : json["order_type"],
        order_code: json["order_code"] == null ? null : json["order_code"],
        productList: json["products"] == null
            ? null
            : List<OrderItem>.from(
                json["products"].map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": productList,
        "shift": shift,
        "order_code": order_code,
        "order_type": order_type,
        "date": date,
        "id": id,
      };
}
