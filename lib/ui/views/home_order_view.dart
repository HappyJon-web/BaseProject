import 'package:baseproject/core/viewmodels/home_viewmodel.dart';
import 'package:baseproject/ui/views/base_view.dart';
import 'package:baseproject/ui/views/common_view/handler_view.dart';
import 'package:baseproject/ui/views/shift_date_order_view.dart';
import 'package:flutter/material.dart';

class HomeOrderView extends StatefulWidget {
  const HomeOrderView({Key key}) : super(key: key);

  @override
  State<HomeOrderView> createState() => _HomeOrderView();
}

class _HomeOrderView extends State<HomeOrderView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onModelReady: (model) async {
          await model.init();
        },
        builder: (context, model, child) => ViewHandler(
              onRefresh: () {
                model.init();
              },
              viewState: model.state,
              child: ListView.builder(
                itemCount: model.orderList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ShiftDateOrderView(
                                title: model.orderList[index].date,
                                shiftId: model.orderList[index].shiftId,
                              );
                            },
                          ),
                        );
                      },
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          model.orderList[index].date,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          model.orderList[index].shift,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          model.orderList[index].orderNo
                                                  .toString() +
                                              ' orders',
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'RM ' +
                                              model.orderList[index].sales
                                                  .toString(),
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
                                  model.orderList[index].pending.toString() +
                                      " pending",
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
                                  model.orderList[index].accepted.toString() +
                                      " accepted",
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
                                  model.orderList[index].rejected.toString() +
                                      " rejected",
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
                  );
                },
              ),
            ));
  }
}
