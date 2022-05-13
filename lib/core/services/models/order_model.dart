import 'package:baseproject/core/services/models/orderList_model.dart';

class Order {
  String date;
  int id;
  String shift;
  int shiftId;
  int pendingCount;
  int orderNo;
  int pending;
  int accepted;
  int rejected;
  double sales;
  List<OrderList> shiftOrderList;

  Order(
      {this.date,
      this.pendingCount,
      this.shift,
      this.id,
      this.pending,
      this.accepted,
      this.rejected,
      this.orderNo,
      this.sales,
      this.shiftId,
      this.shiftOrderList});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        shift: json["shift"] == null ? null : json["shift"],
        shiftId: json["shift_id"] == null ? null : int.parse(json["shift_id"]),
        orderNo: json["total_orders"] == null
            ? null
            : int.parse(json["total_orders"].toString()),
        sales: json["total_sales"] == null
            ? null
            : double.parse(json["total_sales"].toString()),
        date: json["date"] == null ? null : json["date"],
        id: json["id"] == null ? null : json["id"],
        shiftOrderList: json["orders"] == null
            ? null
            : List<OrderList>.from(
                json["orders"].map((x) => OrderList.fromJson(x))),
        pending: json["status"]["pending"] == null
            ? null
            : int.parse(json["status"]["pending"].toString()),
        accepted: json["status"]["accepted"] == null
            ? null
            : int.parse(json["status"]["accepted"].toString()),
        rejected: json["status"]["rejected"] == null
            ? null
            : int.parse(json["status"]["rejected"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "pending": pending,
        "accepted": accepted,
        "rejected": rejected,
        "total_orders": orderNo,
        "total_sales": sales,
        "shift": shift,
        "date": date,
        "id": id,
      };
}
