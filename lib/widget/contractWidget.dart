import 'package:apra_printing/model/client.dart';
import 'package:flutter/material.dart';
import 'package:apra_printing/model/printer.dart';

class ContractWidget extends StatelessWidget {

  final String cliente;

  const ContractWidget(this.cliente);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        child: ListTile(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Icon(Icons.account_circle),
          title: Text(cliente),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
