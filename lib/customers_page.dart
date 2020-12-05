import 'package:apra_printing/main.dart';
import 'package:flutter/material.dart';


class CustomersPage extends StatefulWidget {
  @override
  _CustomersStatePage createState() => _CustomersStatePage();
}

class _CustomersStatePage extends State<CustomersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customers'),
      ),
      body: Center(
        child: Text('This is Customers Page'),
      ),

    );
  }
}

