import 'dart:async';
import 'package:apra_printing/model/client.dart';
import 'file:///C:/Users/stsan/AndroidStudioProjects/apra_printing/lib/NON%20USATI%20AL%20MOMENTO/contratcts_OLD.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:grouped_list/grouped_list.dart';

import 'dart:convert';
import 'printer.dart';

//TODO: Qui andro'a memorizzare lo stato della mia applicazione che verra' poi
//TODO: passato a tutte le pagine. Quindi vado a elaboare anche la lista di
//TODO: stampanti e trasformarla in lista di clienti.

class AppState extends ChangeNotifier {
  List<Client> clientList = [];
  List<Printer> printerList = [];

  Future caricaListe(BuildContext context) async {
    debugPrint('caricamento liste stampanti');

    final data = await DefaultAssetBundle.of(context)
        .loadString('assets/apracs_printing.json');
    List<dynamic> stampanti = json.decode(data);
    printerList = stampanti
        .cast<Map<String, dynamic>>()
        .map((e) => Printer.fromJson(e))
        .toList();

    return notifyListeners();
  }
}
