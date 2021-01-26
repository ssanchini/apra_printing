import 'package:apra_printing/model/appState.dart';
import 'package:apra_printing/model/printer.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
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
                  padding: EdgeInsets.all(15),
                  color: Colors.blueAccent,
                  margin: const EdgeInsets.all(10),
                  child: Text("Prossime scadenze imminenti:"),
                ),
              ),
              Selector<AppState, Map<DateTime, List<Printer>>>(
                  selector: (_, state) => state.eventi,
                  builder: (context, list, _) {

                    debugPrint('Building pre ListView $runtimeType');
                    return Expanded(
                        child: CustomScrollView(
                        slivers: [
                          SliverList(
                          delegate:
                            SliverChildBuilderDelegate((context, index) {
                              final key = list.keys.elementAt(index);

                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("$key", style: TextStyle(fontSize: 20,)),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children:
                                    list[key].map((e) => Text("$e")).toList(),
                                  )
                                ],
                              );
                            },
                             childCount: 5),
                        ),
                      ],
                    ));
                  })
            ],
          )),
      backgroundColor: Colors.white,
    );
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
