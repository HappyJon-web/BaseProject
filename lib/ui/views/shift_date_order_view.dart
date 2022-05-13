import 'package:baseproject/core/viewmodels/order_viewmodel.dart';
import 'package:baseproject/ui/views/common_view/handler_view.dart';
import 'package:baseproject/ui/widget/orders_tab.dart';
import 'package:baseproject/ui/widget/summary_tab.dart';
import 'package:flutter/material.dart';
import 'package:baseproject/ui/views/base_view.dart';
import 'package:baseproject/ui/views/home.dart';

class ShiftDateOrderView extends StatefulWidget {
  final String title;
  final int shiftId;
  ShiftDateOrderView({this.title, this.shiftId});

  @override
  State<ShiftDateOrderView> createState() => _ShiftDateOrderViewState();
}

class _ShiftDateOrderViewState extends State<ShiftDateOrderView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<OrderViewModel>(
      onModelReady: (model) async {
        await model.init(widget.shiftId, widget.title);
      },
      builder: (context, model, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "Orders"),
                Tab(text: "Summary"),
              ],
            ),
            title: Text(widget.title),
          ),
          body: ViewHandler(
            onRefresh: () async {
              await model.init(widget.shiftId, widget.title);
            },
            viewState: model.state,
            child: TabBarView(
              children: [
                OrdersTab(orderList: model.shiftOrderList),
                SummaryTab(
                  orderItem: model.shiftOrderItem,
                  orderShift: model.shiftOrder,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
