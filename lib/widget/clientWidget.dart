import 'package:flutter/material.dart';

class ClientsWidget extends StatelessWidget {
  final String cliente;

  const ClientsWidget(this.cliente);

  @override
  Widget build(BuildContext context) {
    return  Card(
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
