import 'package:flutter/material.dart';

class CurrencyInput extends StatelessWidget {
  CurrencyInput({
    @required this.label,
    @required this.currencySymbol,
    @required this.inputController,
    @required this.changed,
  });

  final String label;
  final String currencySymbol;

  final TextEditingController inputController;
  final Function changed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: this.changed,
        controller: this.inputController,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.numberWithOptions(
          decimal: true,
        ),
        cursorColor: Colors.deepPurple,
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 22.0,
        ),
        decoration: InputDecoration(
          prefixText: this.currencySymbol,
          labelText: this.label,
          labelStyle: TextStyle(
            fontSize: 20.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Colors.deepOrange,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Colors.deepOrange,
            ),
          ),
        ),
      ),
    );
  }
}
