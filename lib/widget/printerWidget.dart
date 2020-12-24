import 'package:apra_printing/model/printer.dart';
import 'package:flutter/material.dart';

class PrinterWidget extends StatelessWidget {

  final Printer stampante;

  const PrinterWidget(this.stampante);

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
                Text(stampante.rag_cliente)
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
                Text(stampante.marca),
                Text(" "),
                Text(stampante.modello),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 34,
                ),
                Text("SN: "),
                Text(stampante.serial_number),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 34,
                ),
                Text("Scadenza contratto: "),
                Text(stampante.fineContratto.toString()),
                Text("-"),
                Text(stampante.fineContratto.toString()),
                Text("-"),
                Text(stampante.fineContratto.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}