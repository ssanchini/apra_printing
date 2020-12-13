import 'package:apra_printing/model/printer.dart';
import 'package:flutter/material.dart';

class PrinterCard extends StatelessWidget {
  final Printer _printer;

  const PrinterCard(this._printer);

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,),
                const SizedBox(
                  width: 10,
                ),
                Text(_printer.rag_cliente
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SizedBox(
                  width: 34,
                ),
                Text(_printer.marca),
                Text(" "),
                Text(_printer.modello),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 34,
                ),
                Text("SN: "),
                Text(_printer.serial_number),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 34,
                ),
                Text("Scadenza contratto: "),
                Text(_printer.fineContratto.day.toString()),
                Text("-"),
                Text(_printer.fineContratto.month.toString()),
                Text("-"),
                Text(_printer.fineContratto.year.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}