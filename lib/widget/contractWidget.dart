import 'package:apra_printing/model/printer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ContractWidget extends StatelessWidget {

  final String contratto;
  final int numContratti;
  final List<Printer> stampante;

  const ContractWidget(this.contratto, this.numContratti, this.stampante);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(contratto),
      ),
      body:
      ListView.builder(
        itemCount: numContratti,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Marca:                                ${stampante[index].marca}") ,
                  SizedBox(height: 10,),
                  Text("Modello:                             ${stampante[index].modello}") ,
                  SizedBox(height: 10,),
                  Text("SN:                                      ${stampante[index].serial_number}") ,
                  SizedBox(height: 10,),
                  Text("Data Inizio contratto:       ${formatDateStart(stampante[index].installazione)}") ,
                  SizedBox(height: 10,),
                  Text("Data fine contratto:          ${formatDateEnd(stampante[index].fineContratto)}") ,
                  SizedBox(height: 10,),
                ],
              ),
            ),
          );
        }
      )
    );
  }

  formatDateStart (dataInizio ) {
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedStart = formatter.format(dataInizio);
    return formattedStart;
  }

  formatDateEnd (dataFine ) {
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedEnd = formatter.format(dataFine);
    return formattedEnd;
  }

}
