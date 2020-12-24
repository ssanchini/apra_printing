import 'dart:collection';
import 'package:apra_printing/model/printer.dart';

class PrinterState {
  PrinterState(this._items);

  List<Printer> _items = [];
  List<Printer> get items => UnmodifiableListView(_items);

  int get itemCount => _items.length;

}