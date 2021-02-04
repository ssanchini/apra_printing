import 'package:apra_printing/model/printer.dart';
import 'package:apra_printing/widget/clientWidget.dart';
import 'package:apra_printing/widget/contractWidget.dart';
import 'package:flutter/material.dart';
import 'package:apra_printing/model/appState.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:provider/provider.dart';

class ClientsPage extends StatefulWidget {
  @override
  _clientsState createState() => _clientsState();
}

class _clientsState extends State<ClientsPage> {

  bool isSearching = false;
  SearchBar searchBar;

  @override
  void initState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: (value) => context.read<AppState>().filtra(value),
        buildDefaultAppBar: buildAppBar
    );
  }


  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: !isSearching
          ? Text('Clients')
          : TextField(
        onChanged: (value) => context.read<AppState>().filtra(value),
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: "Search client here",
            hintStyle: TextStyle(color: Colors.white)
        ),
      ),
      actions: <Widget>[
        isSearching
            ? IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            setState(() {
              context.read<AppState>().resettaFiltri();
              this.isSearching = false;
              // TODO' Qui devo resettare la ricerca
            });
          },
        )
            : IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              this.isSearching = true;
            });
          },
        )
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: searchBar.build(context),
        body: Selector<AppState, Map<String, List<Printer>>>(
            selector: (_, state) => state.contrattiFiltrati,
            builder: (context, list, _) {
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
