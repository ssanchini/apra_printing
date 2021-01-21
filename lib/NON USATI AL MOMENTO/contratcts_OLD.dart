import 'package:apra_printing/model/appState.dart';
import 'package:apra_printing/model/printer.dart';
import 'package:apra_printing/widget/contractWidget.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

class Contracts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return Scaffold(
      appBar: AppBar(
        title: Text('Clients'),
      ),
      body:
       Selector<AppState, List<Printer>>(
                selector: (_, state) => state.printersList,
                builder: (context, list, _) {
                  debugPrint('Building pre ListView $runtimeType');
                  // Qui list è la tua lista di stampanti che hai in AppState
                  return
                    ListView.builder(
                      padding:
                      EdgeInsets.symmetric(vertical: 10),
                      itemBuilder: (BuildContext _, int _i) {
                        return Text(list[_i].rag_cliente);
                      },
                      itemCount: list.length,
                    );
                })
    );
  }
}

/****************************************************************************
    return MaterialApp(
    home: Scaffold(
    body: GroupedListView<dynamic, String>(
    elements: stampanti,
    groupBy: (element) => element['ragione_sociale'],
    groupComparator: (value1, value2) => value2.compareTo(value1),
    itemComparator: (item1, item2) =>
    item1['serial_number'].compareTo(item2['serial_number']),
    order: GroupedListOrder.DESC,
    useStickyGroupSeparators: true,
    groupSeparatorBuilder: (String value) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
    value,
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold),
    ),
    ),
    itemBuilder: (c, element) {
    return Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(
    horizontal: 10.0, vertical: 6.0),
    child: Container(
    child: ListTile(
    contentPadding: EdgeInsets.symmetric(
    horizontal: 20.0, vertical: 10.0),
    leading: Icon(Icons.account_circle),
    title: Text(element['ragione_sociale']),
    trailing: Icon(Icons.arrow_forward),
    ),
    ),
    );
    })));

 ************************************************************************/
