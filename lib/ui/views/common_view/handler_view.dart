import 'package:baseproject/core/enums/viewstate.dart';
import 'package:baseproject/ui/views/common_view/error_view.dart';
import 'package:baseproject/ui/views/common_view/internet_view.dart';
import 'package:baseproject/ui/views/common_view/loading_view.dart';
import 'package:flutter/material.dart';

///This Widget will be the root of each view
///Handling data null error and loading state

class ViewHandler extends StatefulWidget {
  final Widget child;
  final Function onRefresh;
  final ViewState viewState;

  const ViewHandler(
      {Key key,
      @required this.onRefresh,
      @required this.child,
      @required this.viewState})
      : super(key: key);

  @override
  _ViewHandlerState createState() => _ViewHandlerState();
}

class _ViewHandlerState extends State<ViewHandler> {
  @override
  Widget build(BuildContext context) {
    switch (widget.viewState) {
      case ViewState.Busy:
        return Center(
          child: loadingWidget(),
        );
      case ViewState.Idle:
        return widget.child;
      case ViewState.Error:
        return ErrorView(
          someFunction: widget.onRefresh,
        );
      case ViewState.Internet:
        return InternetView(
          someFunction: widget.onRefresh,
        );
      default:
        return Container();
    }
  }
}
