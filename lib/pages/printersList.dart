import 'package:flutter/material.dart';

import 'package:apra_printing/widget/printerCard.dart';
import 'package:apra_printing/model/printer.dart';
import 'package:apra_printing/widget/clientCard.dart';
import 'package:apra_printing/model/client.dart';


/*



class CompilaListaClienti extends StatefulWidget {
  @override
  _CompilaState createState() => _CompilaState();
}

class _CompilaState extends State<CompilaListaClienti> {

  compilaSchedaCliente() {
    for(int i = 0; i < printersList.length; i++) {
      int c = i -1;
      if (printersList[i].rag_cliente ==  listaClienti[c].rag_sociale) {
        listaClienti[c].num_contratti ++;
        if (listaClienti[c].prossima_scadenza_cliente.isAfter(printersList[i].fineContratto)) {
          listaClienti[c].prossima_scadenza_cliente = printersList[i].fineContratto;
        }
      } else // sono diversi
          {
            c++;
            listaClienti[c].rag_sociale = printersList[i].rag_cliente;
            listaClienti[c].num_contratti = 1;
            listaClienti[c].prossima_scadenza_cliente = printersList[i].fineContratto;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      compilaSchedaCliente();
  }
} // fine classe
*/
class ClientListShow extends StatefulWidget {
  @override
  _ClientListShowState createState() => _ClientListShowState();
}

class _ClientListShowState extends State<ClientListShow> {

  List printersList = [
    Printer(1, "ACOF","SAMSUNG","M4080FX","0GX8BJEG90000QN",DateTime.parse("2016-12-27") ,1881,0,DateTime.parse("2020-03-31"),),
    Printer(2, "ACOF","HP","HP LASERJET MFP E72530","CNC1L88007",DateTime.parse("2019-02-22") ,3281,0,DateTime.parse("2023-02-23")),
    Printer(3, "ACOF","SAMSUNG","ML451X 501X SERIES","Z5TFBJFJ10002AZ",DateTime.parse("2019-06-24") ,1266,0,DateTime.parse("2023-06-24")),
    Printer(4, "ACOF S.GIORGIO","SAMSUNG","M337X 387X 407X SERIES","ZDGTBJAF500006E",DateTime.parse("2015-02-18") ,416,0,DateTime.parse("2019-02-18")),
    Printer(5, "AGRIFOGLIA SRL","SAMSUNG","M4580FX","079FBJFJ10000EZ",DateTime.parse("2020-09-15") ,1160 , 0 ,DateTime.parse("2024-09-15")),
    Printer(6, "AGRIFOGLIA SRL","HP","HP LASERJET PRO MFP M521DN","CNDKLBQ9GF",DateTime.parse("2020-09-15") ,881,0,DateTime.parse("2024-09-15")),
    Printer(7, "ALA SPA FABBRICA ARREDAMENTI","SAMSUNG","M5360RX","075BBJFH40000BA",DateTime.parse("2020-07-07") ,5932,0,DateTime.parse("2024-07-07")),
    Printer(8, "ALA SPA FABBRICA ARREDAMENTI" , "SAMSUNG", "M5360RX" ,"0C7PBJFHB0000LA", DateTime.parse("2017-03-16") ,580,0,DateTime.parse("2021-03-16")),
    Printer(9, "ALBA SRL SOCIETA' UNIPERSONALE","HP","HP PAGEWIDE COLOR MFP P77940","NLBVMC70W",DateTime.parse("2020-06-29") ,324,304,DateTime.parse("2024-06-29")),
    Printer(10, "APRA Computer Systems srl","SAMSUNG","X4250LX","28TVB1AH600032M",DateTime.parse("2017-06-29") ,392,364,DateTime.parse("2021-06-29")),
    Printer(11, "APRA Computer Systems srl","LEXMARK","E460DN","72H8D80",DateTime.parse("2011-03-03"),936,0,DateTime.parse("2015-03-03")),
    Printer(12, "APRA Computer Systems srl","LEXMARK","E460DN","72HZ1R3",DateTime.parse("2016-03-03"),1110,0,DateTime.parse("2020-03-12")),
    Printer(13, "APRA Computer Systems srl","LEXMARK","E360DN","72MGW34",DateTime.parse("2011-03-03"),550,0,DateTime.parse("2015-05-12")),
    Printer(14, "APRA Computer Systems srl","LEXMARK","E360DN","72MGW7K",DateTime.parse("2011-03-03"),151,0,DateTime.parse("2015-06-21")),
    Printer(15, "APRA Computer Systems srl","LEXMARK","E360DN","72MGWD5",DateTime.parse("2011-03-03"),50,0,DateTime.parse("2015-07-20")),
    Printer(16, "APRA Computer Systems srl","LEXMARK","E360DN","72MGWFL",DateTime.parse("2011-03-03"),277,0,DateTime.parse("2015-05-15")),
    Printer(17, "APRA Computer Systems srl","LEXMARK","E360DN","72MGWFZ",DateTime.parse("2011-03-03"),497,0,DateTime.parse("2015-03-29")),
    Printer(18, "APRA Computer Systems srl","LEXMARK","E360DN","72MGWG5",DateTime.parse("2014-03-03"),423,0,DateTime.parse("2018-11-24")),
    Printer(19, "APRA Computer Systems srl","LEXMARK","X656DE","793XYVV",DateTime.parse("2011-03-03"),1890,0,DateTime.parse("2015-12-01")),
    Printer(20, "APRA Computer Systems srl","HP","HP PAGEWIDE PRO 477DW MFP","CN7CEHX0BT",DateTime.parse("2018-08-10"),1220,82,DateTime.parse("2022-08-10")),
    Printer(21, "ARCANSAS SRL","SAMSUNG","M4080FX","000000000000000",DateTime.parse("2018-03-21"),4888,0,DateTime.parse("2022-03-21")),
    Printer(22, "ARCANSAS SRL","SAMSUNG","M4580FX","079FBJFJ400016L",DateTime.parse("2017-08-03"),2297,0,DateTime.parse("2021-08-03")),
    Printer(23, "ARCANSAS SRL","SAMSUNG","M4580FX","079FBJFJ400093X",DateTime.parse("2017-08-03"),33,0,DateTime.parse("2021-08-03")),
  ];

  List<Client> listaClienti = [];

  compilaSchedaCliente() {
    for (int i = 0; i < printersList.length; i++) {
      int c = i - 1;
      if (printersList[i].rag_cliente == printersList[c].rag_cliente) {
        listaClienti[i].num_contratti ++;
        if (listaClienti[c].prossima_scadenza_cliente.isAfter(
            printersList[i].fineContratto)) {
          listaClienti[c].prossima_scadenza_cliente =
              printersList[i].fineContratto;
        }
      } else // sono diversi
          {
        c++;
        listaClienti[c].rag_sociale = printersList[i].rag_cliente;
        listaClienti[c].num_contratti = 1;
        listaClienti[c].prossima_scadenza_cliente = printersList[i].fineContratto;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    compilaSchedaCliente();
    return
      ListView.builder(
          padding:
          EdgeInsets.symmetric(vertical: 10),
           itemBuilder: (BuildContext _, int _i) {
            return PrinterCard(printersList[_i]);
            },
            itemCount: printersList.length,
      );
  } // chiudo Widget

}





/*


   */

