import 'dart:convert';
import 'dart:developer';

import 'package:baseproject/core/enums/viewstate.dart';
import 'package:baseproject/core/services/login_service.dart';
import 'package:baseproject/core/services/models/orderItem_model.dart';
import 'package:baseproject/core/services/models/orderList_model.dart';
import 'package:baseproject/core/services/models/order_model.dart';
import 'package:baseproject/core/services/order_service.dart';
import 'package:baseproject/core/services/request/request_order.dart';
import 'package:baseproject/core/services/respond/res_login.dart';
import 'package:baseproject/core/services/respond/res_order.dart';
import 'package:baseproject/core/services/respond/res_orderItem.dart';
import 'package:baseproject/core/services/respond/res_orderList.dart';
import 'package:baseproject/core/utilities/print_utils.dart';
import 'package:baseproject/core/utilities/shared_pref_util.dart';
import 'package:baseproject/core/viewmodels/base_model.dart';
import 'package:baseproject/locator.dart';
import 'package:bot_toast/bot_toast.dart';

class OrderViewModel extends BaseModel {
  List<OrderList> shiftOrderList;
  List<OrderItem> shiftOrderItem;
  Order shiftOrder;
  OrderService orderService = locator<OrderService>();

  init(int shiftId, String date) async {
    setState(ViewState.Busy);
    await getOrderList(shiftId, date);
    await getOrderItem(shiftId, date);
  }

  getOrderList(int shiftId, String date) async {
    bool status = false;
    shiftOrderList = [];
    try {
      OrderListResponse orderListResponse = await orderService
          .getOrderList(OrderRequest(shiftId: shiftId, date: date));
      status = orderListResponse.status;
      if (status == true) {
        shiftOrderList = orderListResponse.data.shiftOrderList;
        shiftOrder = orderListResponse.data;
        setState(ViewState.Idle);
      }
    } catch (error, stackTrace) {
      Log.printError(error, stackTrace);
      setState(ViewState.Error);
    }
    return status;
  }

  getOrderItem(int shiftId, String date) async {
    bool status = false;
    shiftOrderItem = [];
    try {
      OrderItemResponse orderItemResponse =
          await orderService.getOrderItem(shiftId, date);
      status = orderItemResponse.status;
      if (status == true) {
        shiftOrderItem = orderItemResponse.data;
        setState(ViewState.Idle);
      }
    } catch (error, stackTrace) {
      Log.printError(error, stackTrace);
      setState(ViewState.Error);
    }
    return status;
  }
}
