import 'dart:convert';

String orderRequestToJson(OrderRequest data) => json.encode(data.toJson());

class OrderRequest {
  int shiftId;
  String date;

  OrderRequest({this.shiftId, this.date});

  Map<String, dynamic> toJson() => {
        "shift_id": shiftId,
        "date": date,
      };
}