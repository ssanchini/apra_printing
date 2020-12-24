import 'package:apra_printing/model/appState.dart';
import 'package:apra_printing/model/printer.dart';
import 'package:apra_printing/widget/contractWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

class Contracts extends StatelessWidget {

  Printer _confronto;
  int i =0;

  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return Scaffold(
        appBar: AppBar(
          title: Text('Clients'),
        ),
        body: Selector<AppState, List<Printer>>(
            selector: (_, state) => state.printerList,
            builder: (context, list, _) {
              debugPrint('Building pre ListView $runtimeType');
              // Qui list è la tua lista di stampanti che hai in AppState
              return GroupedListView<Printer, String>(
                  elements: list,
                  groupBy: (element) => element.toString(),
                  groupComparator: (value1, value2) => value2.compareTo(value1),
                  itemComparator: (item1, item2) =>
                      item1.rag_cliente.compareTo(item2.rag_cliente),
                  order: GroupedListOrder.ASC,
                  useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (String value) => Padding(
                        padding: const EdgeInsets.all(0.0),
                        //child: Text(
                        //value,
                        //textAlign: TextAlign.center,
                        //style: TextStyle(
                        //fontSize: 20, fontWeight: FontWeight.bold, ),
                        //),
                      ),
                  itemBuilder: (c, element) {

                    if (i == 0) {
                      _confronto.rag_cliente.toString() = 'ACOF';
                      i ++;
                      return ContractWidget(element);
                    } else if (_confronto.rag_cliente == element.rag_cliente ) {
                      return null;
                    } else
                      {
                        return ContractWidget(element);
                      }
                    //} // fine if
                  });
            }));
  }
}
