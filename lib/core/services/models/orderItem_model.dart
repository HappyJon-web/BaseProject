class OrderItem {
  int id;
  String name;
  String product_code;
  String optionString;
  int quantity;
  int pendingCount;

  OrderItem(
      {this.id,
      this.name,
      this.product_code,
      this.optionString,
      this.quantity,
      this.pendingCount});

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        product_code:
            json["product_code"] == null ? null : json["product_code"],
        optionString:
            json["optionString"] == null ? null : json["optionString"],
        quantity: json["quantity"] == null ? null : json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "optionString": optionString,
        "quantity": quantity,
        "product_code": product_code,
        "name": name,
        "id": id,
      };
}
