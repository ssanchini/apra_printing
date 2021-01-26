import 'package:apra_printing/model/printer.dart';
import 'package:apra_printing/widget/clientWidget.dart';
import 'package:apra_printing/widget/contractWidget.dart';
import 'package:flutter/material.dart';
import 'package:apra_printing/model/appState.dart';
import 'package:provider/provider.dart';

class ClientsPage extends StatefulWidget {
  @override
  _clientsState createState() => _clientsState();
}

class _clientsState extends State<ClientsPage> {
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
                  int l = list[key].length;
                  List<Printer> pri = list[key];
                  return InkWell(
                      onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      ContractWidget(key, l, pri)));
                      },
                      child:
                        ClientsWidget(key),
                  );
                },
              );
            })
    );
  }
} // chiudo Widgetchiudo Widget
