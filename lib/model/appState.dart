import 'dart:async';
import 'package:apra_printing/model/client.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'dart:convert';
import 'printer.dart';

//TODO: Qui andro'a memorizzare lo stato della mia applicazione che verra' poi
//TODO: passato a tutte le pagine. Quindi vado a elaboare anche la lista di
//TODO: stampanti e trasformarla in lista di clienti.

class AppState extends ChangeNotifier {

  List<Client> clientsList = [];
  List<Printer> printersList = [];
  Map<Client, List<Printer>> contratti = {};

  //TODO: creo due liste, una di clienti e una di contratti/stampanti
  //TODO: imposto la mappa (Client, Lista stampanti) perche' ad ogni cliente
  //TODO: possono corrispondere piu' stampanti

  int c = 0;
  int num_contratti = 0;
  String appoggio;

  Future init(BuildContext context) async {
    debugPrint('caricamento liste stampanti');

    final data = await DefaultAssetBundle.of(context)
        .loadString('assets/apracs_printing.json');
    List<dynamic> stampanti = json.decode(data);
    printersList = stampanti
        .cast<Map<String, dynamic>>()
        .map((e) => Printer.fromJson(e))
        .toList();


    for (int i = 0; i < printersList.length; i ++) {
      if (i == 0)
      {
        c = 1;
        appoggio = printersList[i].rag_cliente.toString();
      }
      else if ( appoggio == printersList[i].rag_cliente.toString()) {
        c ++;
      }
      else
        {
          clientsList.add(Client(appoggio, c));
          appoggio = printersList[i].rag_cliente.toString();
          c = 1;
        }
      //clientsList.add(Client(printersList[i].rag_cliente.toString(), num_contratti));
      //if (contratti.containsKey(printersList[i].rag_cliente)) {
        //debugPrint('Building $runtimeType');
      //}
      //else {
        //debugPrint('Building $runtimeType');

      }
    debugPrint('I contratti sono : '+ printersList.length.toString());
    debugPrint('I clienti sono : '+ clientsList.length.toString());
    return notifyListeners();
    }
  }

  // Map<Printer, List> caricaEventi()  {
   //Map<DateTime, List> prendiDate;
  //  String link = ;

  //}




