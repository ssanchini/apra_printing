import 'dart:async';
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

  List<Printer> printersList = [];
  Map<String, List<Printer>> contratti = {};
  Map<DateTime, List<Printer>> eventi = {};

  //TODO: creo due liste, una di clienti e una di contratti/stampanti
  //TODO: imposto la mappa (Client, Lista stampanti) perche' ad ogni cliente
  //TODO: possono corrispondere piu' stampanti

  int c = 0;
  int num_contratti = 0;

  Future init(BuildContext context) async {
    debugPrint('caricamento liste stampanti');

    final data = await DefaultAssetBundle.of(context)
        .loadString('assets/apracs_printing.json');
    List<dynamic> stampanti = json.decode(data);
    printersList = stampanti
        .cast<Map<String, dynamic>>()
        .map((e) => Printer.fromJson(e))
        .toList();

    List<Printer> listByDate = List.from(printersList);

    listByDate.sort((a,b) => a.fineContratto.compareTo(b.fineContratto));

    //TODO: qui implemento la mappa con chiave la data di finecontratto
    eventi = groupBy(listByDate, (key) => key.fineContratto);

    //TODO: qui implemento la mappa di contratti con chiave la ragione sociale
    for (int i = 0; i < printersList.length; i ++) {
      if (contratti.containsKey(printersList[i].rag_cliente) )
      {
        contratti[printersList[i].rag_cliente].add(printersList[i]);
      }
      else
        {
          List<Printer> listaStampanti = [printersList[i]];
          contratti[printersList[i].rag_cliente] = listaStampanti;
        }
    }

    debugPrint('I clienti sono ' + contratti.length.toString());
    debugPrint('Le stampanti sono : '+ printersList.length.toString());

    return notifyListeners();
    }
  }





