import 'package:flutter/material.dart';

class MoneySymbol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 30.0,
      ),
      child: Icon(
        Icons.monetization_on,
        color: Colors.deepOrange,
        size: 150.0,
      ),
    );
  }
}
