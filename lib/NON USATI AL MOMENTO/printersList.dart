import 'package:apra_printing/model/printer.dart';
import 'package:flutter/material.dart';


class PrinterList extends StatefulWidget {
  @override
  _printerListState createState() => _printerListState();
}

class _printerListState extends State<PrinterList> {

  List<Printer> _listPrinter;

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        padding:
        EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (BuildContext _, int _i) {
          return null;
        },
        itemCount: _listPrinter.length,
      );
  } // chiudo Widget

}

