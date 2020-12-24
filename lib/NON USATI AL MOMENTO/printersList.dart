
import 'package:apra_printing/model/printer.dart';
import 'package:apra_printing/widget/printerWidget.dart';
import 'package:flutter/material.dart';

/**********************************************************************
class PrinterList extends StatefulWidget {
  @override
  _PrinterListState createState() => _PrinterListState();
}

class _PrinterListState extends State<PrinterList> {

  @override
  Widget build(BuildContext context) {

  }

}
***********************************************************************/


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
          return PrinterWidget(_listPrinter[_i]);
        },
        itemCount: _listPrinter.length,
      );
  } // chiudo Widgetchiudo Widget

}

