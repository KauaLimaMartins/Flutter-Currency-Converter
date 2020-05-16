import 'package:flutter/material.dart';

import './input.widget.dart';

class InputContainer extends StatelessWidget {
  InputContainer({
    @required this.realController,
    @required this.dolarController,
    @required this.euroController,
    @required this.bitcoinController,
    @required this.realChanged,
    @required this.euroChanged,
    @required this.dolarChanged,
    @required this.bitcoinChanged,
  });

  final TextEditingController realController;
  final TextEditingController dolarController;
  final TextEditingController euroController;
  final TextEditingController bitcoinController;

  final Function realChanged;
  final Function euroChanged;
  final Function dolarChanged;
  final Function bitcoinChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CurrencyInput(
          label: 'Real',
          currencySymbol: 'R\$',
          inputController: this.realController,
          changed: this.realChanged,
        ),
        SizedBox(
          height: 14.0,
        ),
        CurrencyInput(
          label: 'Dólar',
          currencySymbol: 'USD\$',
          inputController: this.dolarController,
          changed: this.dolarChanged,
        ),
        SizedBox(
          height: 14.0,
        ),
        CurrencyInput(
          label: 'Euro',
          currencySymbol: '€',
          inputController: this.euroController,
          changed: this.euroChanged,
        ),
        Divider(
          height: 50.0,
          color: Colors.deepOrangeAccent,
        ),
        CurrencyInput(
          label: 'Bitcoin',
          currencySymbol: 'Ƀ',
          inputController: this.bitcoinController,
          changed: this.bitcoinChanged,
        ),
      ],
    );
  }
}
