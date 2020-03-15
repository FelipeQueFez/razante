import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Card(
        elevation: 10,
        child: Row(
          children: <Widget>[Text('Hello')],
        ),
      ),
    );
  }
}
