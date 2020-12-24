import 'dart:convert';

import 'package:flutter/material.dart';

class PrinterListFunz extends StatefulWidget {
  @override
  _PrinterListState createState() => _PrinterListState();
}

class _PrinterListState extends State<PrinterListFunz> {

  LoadData(BuildContext context) async {
    final data = await DefaultAssetBundle.of(context).loadString('assets/apracs_printing.json');
    var printersList = json.decode(data);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contracts"),
        ),
        body: Container(
          child: Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: FutureBuilder(
                future: LoadData(context),
                builder: (context, snapshot) {
                  // Decode the JSON
                  return ListView.builder(
                    // Build the ListView
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(snapshot.data[index]['rag_sociale']) ,
                              SizedBox(height: 10,),
                              Text(snapshot.data[index]['serial_number']),
                              SizedBox(height: 10,),
                              Text(snapshot.data[index]['scadenza'])
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                  );
                }
                ),
          ),
        ));
  }
}
