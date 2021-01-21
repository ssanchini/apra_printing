import 'package:apra_printing/model/printer.dart';
import 'package:flutter/material.dart';

class ContractWidget extends StatelessWidget {

  final String contratto;
  final int numContratti;
  final List<Printer> stampante;

  const ContractWidget(this.contratto, this.numContratti, this.stampante);

  //int numcontratti,

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
                  Text(stampante[index].marca) ,
                  SizedBox(height: 10,),
                  Text(stampante[index].modello) ,
                  SizedBox(height: 10,),
                  Text(stampante[index].serial_number) ,
                  SizedBox(height: 10,),
                  Text(stampante[index].installazione.toString()) ,
                  SizedBox(height: 10,),
                  Text(stampante[index].fineContratto.toString()) ,
                  SizedBox(height: 10,),
                ],
              ),
            ),
          );
        }
      )
    );
  }
}
