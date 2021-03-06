import 'package:apra_printing/model/appState.dart';
import 'package:apra_printing/model/printer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _portraitMode();
          } else {
            return _landscapeMode();
          }
        },
      ),
      backgroundColor: Colors.white,
    );
  }

  _portraitMode() {
    return Container(
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
                          "Upcoming contracts expiring:",
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
                            delegate: SliverChildBuilderDelegate((context, index) {
                              final key = list.keys.elementAt(index);
                              List<Printer> showP = list[key];
                              String printDate = context.read<AppState>().
                              formatDate(key);
                              return ListTile(
                                  title: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text("-------   ${printDate}   -------",
                                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(''),
                                      Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children:  list[key].map((e) =>
                                              showPrinter(e),
                                          ).toList()
                                      )],
                                  ));
                            }, childCount: 5),
                          ),
                        ],),
                    );
                  }),
            ],)
      );
  }

  _landscapeMode() {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Row (
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(''),
                UpsideImage(),
                Text(''),
                Container(
                      height: 35,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.all(5),
                      child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Upcoming contracts expiring:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          ))
                ),
              ],
            ),
            Selector<AppState, Map<DateTime, List<Printer>>>(
                    selector: (_, state) => state.nextEvents,
                    builder: (context, list, _) {
                      debugPrint('Building pre ListView $runtimeType');
                      return Expanded(
                        child: CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate((context, index) {
                                final key = list.keys.elementAt(index);
                                List<Printer> showP = list[key];
                                String printDate = context.read<AppState>().
                                formatDate(key);
                                return ListTile(
                                    title: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Text("-------   ${printDate}   -------",
                                          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(''),
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            mainAxisSize: MainAxisSize.min,
                                            children:  list[key].map((e) =>
                                                showPrinter(e),
                                            ).toList()
                                        )],
                                    ));
                              }, childCount: 5),
                            ),
                          ],),
                      );
                    })
              ],
            ),
    );
  }

}

Widget showPrinter (Printer e) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget> [
      Row(
        children: [
          Text('- '),
          Expanded(
            child:
              Text('${e.rag_cliente}', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left)
            )
        ],
      ),
      Text(' ${e.marca} ${e.modello}', textAlign: TextAlign.left),
      Text(' SN: ${e.serial_number}' ,),
      Text(''),
    ]
  );
}

class UpsideImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/apra_logo.jpg',
          alignment: Alignment.bottomLeft, width: 300),
    );
  }
}
