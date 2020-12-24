import 'package:apra_printing/model/client.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget {
  final Client _client;

  const ClientCard(this._client);

  @override
  Widget build(BuildContext context) {

    return Card(elevation: 4,
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
                Text(_client.rag_sociale
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
                Text("Numero contratti: "),
                Text(_client.num_contratti.toString()),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 34,
                ),
                Text("Prossima Scadenza: "),
                Text(_client.prossima_scadenza_cliente.toString()),
              ],
            ),

          ],
        ),
      ),
    );
  }
}