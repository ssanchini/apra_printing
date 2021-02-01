import 'package:apra_printing/model/appState.dart';
import 'package:apra_printing/model/printer.dart';
import 'package:apra_printing/widget/notificationmanager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeStatePage createState() => _HomeStatePage();
}

class _HomeStatePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UpsideImage(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    height: 35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: const EdgeInsets.all(5),
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Prossime scadenze imminenti:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16),
                        ))),
              ),
              Selector<AppState, Map<DateTime, List<Printer>>>(
                  selector: (_, state) => state.nextEvents,
                  builder: (context, list, _) {
                    debugPrint('Building pre ListView $runtimeType');
                    return Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              final key = list.keys.elementAt(index);
                              List<Printer> showP = list[key];
                              String printDate = formatDate(key);
                              return ListTile(
                                  title: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                          child:
                                          Text("${printDate}",
                                              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold))
                                      ),
                                      Padding(
                                          padding: EdgeInsets.zero,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: list[key].map((e) =>
                                              Text("${e.rag_cliente}\n"
                                                  "${e.marca} ${e.modello} \n"
                                                  "SN: ${e.serial_number}",
                                              maxLines: 4, textAlign: TextAlign.left, )).toList(),

                                        )
                                      ),

                                ],
                              ));
                            }, childCount: 5),
                          ),
                        ],
                      ),
                    );
                  }),
              Selector<AppState, Map<DateTime, List<Printer>>>(
                  selector: (_, state) => state.nextEvents,
                  builder: (context, list, _) {
                    debugPrint('Building pre ListView $runtimeType');
                    final oggi = list.keys.elementAt(0);
                    List<Printer> eventiOggi = list[oggi];
                    debugPrint("Oggi ci sono :  ${eventiOggi.length} eventi");

                    return ElevatedButton(
                      onPressed: () async {
                        for (int i = 0; i < eventiOggi.length; i++) {
                          NotificationManager().showLocalNotification(
                              i,
                              eventiOggi[i].fineContratto,
                              eventiOggi[i].rag_cliente,
                              eventiOggi[i].serial_number,
                              eventiOggi[i].marca,
                              eventiOggi[i].modello);
                        }
                      },
                      child: Text('Show Notification'),
                    );
                  })
            ],
          )),
      backgroundColor: Colors.white,
    );
  }

  formatDate (data) {
    var formatter = new DateFormat('dd-MM-yyyy');
    String formatDate = formatter.format(data);
    return formatDate;
  }

}

class UpsideImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/apra_logo.jpg',
          alignment: Alignment.bottomLeft, width: 350),
    );
  }
}
