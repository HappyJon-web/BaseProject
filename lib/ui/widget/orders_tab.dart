import 'package:baseproject/core/services/models/orderList_model.dart';
import 'package:baseproject/core/services/models/orderItem_model.dart';
import 'package:baseproject/core/viewmodels/order_viewmodel.dart';
import 'package:baseproject/ui/views/base_view.dart';
import 'package:baseproject/ui/views/common_view/handler_view.dart';
import 'package:baseproject/ui/views/shift_date_order_view.dart';
import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  final List<OrderList> orderList;
  const OrdersTab({Key key, this.orderList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderList.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Text(
                          orderList[index].order_code +
                              ' (' +
                              orderList[index].date +
                              ')',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: orderList[index].productList.length,
                    itemBuilder: (context, position) {
                      print(orderList[index].productList.length);
                      return Card(
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Text(' X' +
                                        orderList[index]
                                            .productList[position]
                                            .quantity
                                            .toString() +
                                        '   ' +
                                        orderList[index]
                                            .productList[position]
                                            .product_code +
                                        ' ' +
                                        orderList[index]
                                            .productList[position]
                                            .name +
                                        '\n' +
                                        'Remarks: ' +
                                        orderList[index]
                                            .productList[position]
                                            .optionString),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton.icon(
                        icon: Icon(
                          Icons.check_box,
                          color: Colors.white,
                        ),
                        label: Text("Accept"),
                        textColor: Colors.white,
                        color: Colors.green,
                        onPressed: () {},
                      ),
                      RaisedButton.icon(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        label: Text("Reject"),
                        textColor: Colors.white,
                        color: Colors.red,
                        onPressed: () {},
                      ),
                      RaisedButton.icon(
                        icon: Icon(Icons.print),
                        label: Text("Print"),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
