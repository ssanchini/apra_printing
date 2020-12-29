import 'package:apra_printing/model/printer.dart';
import 'package:apra_printing/widget/contractWidget.dart';
import 'package:flutter/material.dart';
import 'package:apra_printing/model/appState.dart';
import 'package:provider/provider.dart';

class Contracts extends StatefulWidget {
  @override
  _contractsState createState() => _contractsState();
}

class _contractsState extends State<Contracts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Clients'),
        ),
        body: Selector<AppState, Map<String, List<Printer>>>(
            selector: (_, state) => state.contratti,
            builder: (context, list, _) {
              debugPrint('Building pre ListView $runtimeType');
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = list.keys.elementAt(index);

                  return ContractWidget(key);
                },
              );
            }));
  }
} // chiudo Widgetchiudo Widget
