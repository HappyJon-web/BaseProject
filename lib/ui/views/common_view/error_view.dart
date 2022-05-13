import 'package:baseproject/ui/ui_helper/color.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatefulWidget {
  final Function someFunction;

  const ErrorView({Key key, @required this.someFunction}) : super(key: key);
  @override
  _ErrorViewState createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              child: Icon(
                Icons.error,
                color: Colors.black,
                size: 40,
              ),
            ),
            Text(
              "Please check your internet\ntry it again later.",
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            FlatButton(
                color: primaryColor,
                onPressed: () {
                  widget.someFunction.call();
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: Text("Refresh",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.white,
                        ))),
          ],
        ));
  }
}
