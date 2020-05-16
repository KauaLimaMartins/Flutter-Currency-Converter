import 'package:flutter/material.dart';
import 'package:moeda/widgets/money_symbol.widget.dart';
import 'package:moeda/widgets/refresh_button.widget.dart';

import './input_container.widget.dart';

class BuilderHome extends StatefulWidget {
  BuilderHome({
    @required this.futureFunction,
  });

  final Function futureFunction;

  @override
  _BuilderHomeState createState() => _BuilderHomeState();
}

class _BuilderHomeState extends State<BuilderHome> {
  void _realChanged(String text) {
    double real = double.parse(text);
    this.dolarController.text = (real / dolar).toStringAsFixed(2);
    this.euroController.text = (real / euro).toStringAsFixed(2);
    this.bitcoinController.text = (real / bitcoin).toStringAsFixed(5);
  }

  void _dolarChanged(String text) {
    double dolar = double.parse(text);
    this.realController.text = (dolar * this.dolar).toStringAsFixed(2);
    this.euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
    this.bitcoinController.text =
        (dolar * this.dolar / bitcoin).toStringAsFixed(5);
  }

  void _euroChanged(String text) {
    double euro = double.parse(text);
    this.dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
    this.realController.text = (euro * this.euro).toStringAsFixed(2);
    this.bitcoinController.text =
        (euro * this.euro / bitcoin).toStringAsFixed(5);
  }

  void _bitcoinChanged(String text) {
    double bitcoin = double.parse(text);
    this.dolarController.text =
        (bitcoin * this.bitcoin / dolar).toStringAsFixed(2);
    this.euroController.text =
        (bitcoin * this.bitcoin / euro).toStringAsFixed(2);
    this.realController.text = (bitcoin * this.bitcoin).toStringAsFixed(2);
  }

  double bitcoin;
  double euro;
  double dolar;

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final bitcoinController = TextEditingController();

  void clearAll() {
    this.realController.text = '';
    this.dolarController.text = '';
    this.euroController.text = '';
    this.bitcoinController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: this.widget.futureFunction(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 5.0,
              ),
            );
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Erro ao Carregar Dados :(",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              );
            } else {
              bitcoin = snapshot.data['results']['currencies']['BTC']['buy'];
              euro = snapshot.data['results']['currencies']['EUR']['buy'];
              dolar = snapshot.data['results']['currencies']['USD']['buy'];

              return SingleChildScrollView(
                padding: EdgeInsets.only(right: 20.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    MoneySymbol(),
                    InputContainer(
                      realController: this.realController,
                      dolarController: this.dolarController,
                      euroController: this.euroController,
                      bitcoinController: this.bitcoinController,
                      bitcoinChanged: this._bitcoinChanged,
                      dolarChanged: this._dolarChanged,
                      euroChanged: this._euroChanged,
                      realChanged: this._realChanged,
                    ),
                    RefreshButton(
                      pressedFunction: this.clearAll,
                    ),
                  ],
                ),
              );
            }
        }
      },
    );
  }
}
