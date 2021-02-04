import 'dart:async';
import 'package:apra_printing/widget/notificationmanager.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'dart:convert';
import 'printer.dart';
import 'package:http/http.dart' as http;

//TODO: Qui andro'a memorizzare lo stato della mia applicazione che verra' poi
//TODO: passato a tutte le pagine. Quindi vado a elaboare anche la lista di
//TODO: stampanti e trasformarla in lista di clienti.

class AppState extends ChangeNotifier {

  List<Printer> printersList = [];
  List<Printer> listByDate = [];
  List<Printer> listaFiltrata = [];
  Map<String, List<Printer>> contratti = {};
  Map<String, List<Printer>> contrattiFiltrati = {};
  Map<DateTime, List<Printer>> eventi = {};
  Map<DateTime, List<Printer>> nextEvents = {};
  Map<DateTime, List<Printer>> fromToday = {};

  //TODO: creo due liste, una di clienti e una di contratti/stampanti
  //TODO: imposto la mappa (Client, Lista stampanti) perche' ad ogni cliente
  //TODO: possono corrispondere piu' stampanti

  int c = 0;
  int num_contratti = 0;

  Future<List<Printer>> fetchContract(http.Client client) async {
    final listaS =
    await client.get(
        'https://firebasestorage.googleapis.com/v0/b/aspdm-project-f74ab.appspot.com/o/contracts.json?alt=media&token=89b786ef-ae97-426e-a0c0-252900d27a93');
    return parsePrinter(listaS.body);
  }

  List<Printer> parsePrinter(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Printer>((json) => Printer.fromJson(json)).toList();
  }


  void filtra(stringa) {
    contrattiFiltrati = Map.from(contratti)
      ..removeWhere((key, value) => !key.toLowerCase().contains(stringa));
    notifyListeners();
  }

  void resettaFiltri() {
    contrattiFiltrati = Map.from(contratti);
    notifyListeners();
  }


  String formatDate(data) {
    var formatter = new DateFormat('dd-MM-yyyy');
    String formatDate = formatter.format(data);
    return formatDate;
  }


  void notificaGiornaliera() {
    final _today = formatDate(DateTime.now());
    final _firstDate = formatDate(nextEvents.keys.first);
    List<Printer> eventOggi = nextEvents[listByDate.first];
    if (_today == _firstDate) {
      for (int i = 0; i < eventOggi.length; i++) {
        NotificationManager().showLocalNotification(
            i,
            eventOggi[i].fineContratto,
            eventOggi[i].rag_cliente,
            eventOggi[i].serial_number,
            eventOggi[i].marca,
            eventOggi[i].modello);
      }
    }
  }

  Future init(BuildContext context) async {
      final data = await fetchContract(http.Client());

      printersList = data;

      for (int i = 0; i < printersList.length; i ++) {
        if (printersList[i].fineContratto.isAfter(
            DateTime.now().subtract(Duration(days: 1)))) {
          listByDate.add(printersList[i]);
        }
      }

      listByDate.sort((a, b) => a.fineContratto.compareTo(b.fineContratto));
      //TODO: qui implemento la mappa con chiave la data di finecontratto
      eventi = groupBy(printersList, (key) => key.fineContratto);
      nextEvents = groupBy(listByDate, (key) => key.fineContratto);

      //TODO: qui implemento la mappa di contratti con chiave la ragione sociale
      for (int i = 0; i < printersList.length; i ++) {
        if (contratti.containsKey(printersList[i].rag_cliente)) {
          contratti[printersList[i].rag_cliente].add(printersList[i]);
        }
        else {
          List<Printer> listaStampanti = [printersList[i]];
          contratti[printersList[i].rag_cliente] = listaStampanti;
        }
      }

      contrattiFiltrati = Map.from(contratti);

      debugPrint('Next Events ${nextEvents.keys.first}');
      
      debugPrint('I clienti sono ' + contratti.length.toString());
      debugPrint('Le stampanti sono : ' + printersList.length.toString());

      return notifyListeners();
    }
  }







