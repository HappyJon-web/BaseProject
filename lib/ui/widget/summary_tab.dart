import 'package:baseproject/core/services/models/orderItem_model.dart';
import 'package:baseproject/core/services/models/orderList_model.dart';
import 'package:baseproject/core/services/models/order_model.dart';
import 'package:flutter/material.dart';

class SummaryTab extends StatelessWidget {
  final List<OrderItem> orderItem;
  final Order orderShift;
  const SummaryTab({Key key, this.orderItem, this.orderShift})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Card(
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                orderShift.date,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                orderShift.shift,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                orderShift.orderNo.toString() + ' orders',
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'RM ' + orderShift.sales.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    Container(
                        child: RaisedButton.icon(
                      icon: Icon(
                        Icons.access_alarm,
                        color: Color.fromARGB(255, 255, 179, 16),
                      ),
                      label: Text(
                        orderShift.pending.toString() + " pending",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    )),
                    Container(
                        child: RaisedButton.icon(
                      icon: Icon(
                        Icons.check,
                        color: Color.fromARGB(255, 9, 255, 0),
                      ),
                      label: Text(
                        orderShift.accepted.toString() + " accepted",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    )),
                    Container(
                        child: RaisedButton.icon(
                      icon: Icon(
                        Icons.cancel,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                      label: Text(
                        orderShift.rejected.toString() + " rejected",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    )),
                  ])
                ],
              ),
            ),
          ),
        ),
        FlatButton.icon(
          icon: Icon(
            Icons.print,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          label: Text(
            "Print",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          color: Color.fromARGB(255, 55, 55, 55),
          textColor: Colors.white,
          onPressed: () {},
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: orderItem.length,
          itemBuilder: (context, position) {
            return Card(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Text(' X' +
                              orderItem[position].quantity.toString() +
                              '   ' +
                              orderItem[position].product_code +
                              ' ' +
                              orderItem[position].name +
                              '\n' +
                              'Remarks: ' +
                              orderItem[position].optionString),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    ));
  }
}
