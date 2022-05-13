import 'dart:developer';

import 'package:baseproject/core/enums/viewstate.dart';
import 'package:baseproject/core/services/login_service.dart';
import 'package:baseproject/core/services/models/order_model.dart';
import 'package:baseproject/core/services/order_service.dart';
import 'package:baseproject/core/services/request/request_login.dart';
import 'package:baseproject/core/services/respond/res_login.dart';
import 'package:baseproject/core/services/respond/res_order.dart';
import 'package:baseproject/core/utilities/print_utils.dart';
import 'package:baseproject/core/utilities/shared_pref_util.dart';
import 'package:baseproject/core/viewmodels/base_model.dart';
import 'package:baseproject/locator.dart';
import 'package:bot_toast/bot_toast.dart';

class HomeViewModel extends BaseModel {
  LoginService loginService = locator<LoginService>();
  OrderService orderService = locator<OrderService>();
  List<Order> orderList;

  init() async {
    setState(ViewState.Busy);
    await getOrder();
    log(await SharedPrefUtil().getToken());
  }

  getOrder() async {
    bool status = false;
    orderList = [];
    try {
      OrderResponse orderResponse = await orderService.getOrders();
      status = orderResponse.status;
      if (status == true) {
        orderList = orderResponse.data;
        setState(ViewState.Idle);
      }
    } catch (error, stackTrace) {
      Log.printError(error, stackTrace);
      setState(ViewState.Error);
    }
    return status;
  }

 
}
