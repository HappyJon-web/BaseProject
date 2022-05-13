import 'dart:convert';
import 'dart:io';

import 'package:baseproject/core/services/models/order_model.dart';
import 'package:baseproject/core/services/request/req_fcm_token.dart';
import 'package:baseproject/core/services/request/request_login.dart';
import 'package:baseproject/core/services/request/request_logout.dart';
import 'package:baseproject/core/services/request/request_order.dart';
import 'package:baseproject/core/utilities/shared_pref_util.dart';

import '../build_environment.dart';
import 'package:http/http.dart' as http;

import '../utilities/api_base_helper.dart';

class Api {
  var res = Constants.resourceServer;
  var resVersion = Constants.resourceServerVersion;

  // POST SAMPLE API USE CASE
  Future<http.Response> sampleApiRequest() async {
    var uri = Uri.https(res, "$resVersion/some/fake/api/path");
    return await ApiBaseHelper().post(uri, header: null, body: null);
  }

  //POST LOGIN
  Future<http.Response> emailLogin(LoginRequest loginRequest) async {
    var uri = Uri.https(res, "$resVersion/merchant/login");
    http.Response response = await ApiBaseHelper()
        .post(uri, header: null, body: loginRequestToJson(loginRequest));
    return response;
  }

  //GET ORDER LIST
  Future<http.Response> fetchOrder() async {
    var uri = Uri.https(res, "$resVersion/merchant/orders/latest");
    http.Response response =
        await ApiBaseHelper().get(uri, await SharedPrefUtil().getToken());
    return response;
  }

  //GET ITEM LIST BY DATE AND SHIFT
  Future<http.Response> fetchOrderItem(int shiftId, String date) async {
    var uri = Uri.https(
        res, "$resVersion/merchant/orders/itembyshift/$date/$shiftId");
    http.Response response =
        await ApiBaseHelper().get(uri, await SharedPrefUtil().getToken());
    return response;
  }

  //GET ORDER LIST BY DATE
  Future<http.Response> fetchOrderList(OrderRequest orderRequest) async {
    var uri = Uri.https(res, "$resVersion/merchant/orders/details");
    print(orderRequest.toJson());
    http.Response response = await ApiBaseHelper().post(uri,
        header: await SharedPrefUtil().getToken(),
        body: orderRequestToJson(orderRequest));
    return response;
  }

  //REMOVE FIREBASE TOKEN / LOGOUT
  Future<http.Response> logoutToken(LogoutRequest logoutRequest) async {
    var uri = Uri.https(res, "$resVersion/merchant/firebase/delete");
    http.Response response = await ApiBaseHelper().post(uri,
        header: await SharedPrefUtil().getToken(),
        body: logoutRequestToJson(logoutRequest));
    return response;
  }
}
