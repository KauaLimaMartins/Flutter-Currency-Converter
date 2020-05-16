import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  RefreshButton({@required this.pressedFunction});

  final Function pressedFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
        right: 150.0,
        left: 150.0,
      ),
      child: RaisedButton(
        color: Colors.deepOrangeAccent,
        onPressed: this.pressedFunction,
        padding: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
        ),
        child: Icon(
          Icons.refresh,
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }
}
