import 'package:baseproject/core/services/models/order_model.dart';
import 'package:baseproject/core/services/request/request_order.dart';
import 'package:baseproject/core/services/respond/res_order.dart';
import 'package:baseproject/core/services/respond/res_orderItem.dart';
import 'package:baseproject/core/services/respond/res_orderList.dart';

import '../../locator.dart';
import 'api.dart';

class OrderService {
  Api _api = locator<Api>();

  getOrders() async {
    var respond = await _api.fetchOrder();
    return orderResponseFromJson(respond.body);
  }

  getOrderItem(int shiftID, String date) async {
    var respond = await _api.fetchOrderItem(shiftID, date);
    return orderItemResponseFromJson(respond.body);
  }

  getOrderList(OrderRequest orderRequest) async {
    var respond = await _api.fetchOrderList(orderRequest);
    return orderListResponseFromJson(respond.body);
  }
}
