import 'package:flutter/material.dart';

class EmptyView extends StatefulWidget {
  const EmptyView({
    Key key,
  }) : super(key: key);
  @override
  _EmptyViewState createState() => _EmptyViewState();
}

class _EmptyViewState extends State<EmptyView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 250,
              child: Image.asset(
                "assets/empty.png",
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Found nothing here",
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
