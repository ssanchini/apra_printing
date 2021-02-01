
import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;

import 'package:intl/intl.dart';
// Questo verifica che 0 e 0.0 siano identici
//import 'package:flutter/foundation.dart' show kIsWeb;

const AndroidNotificationChannel mainChannel = AndroidNotificationChannel (
    'main_notification_channel',
    'Notifiche Fondamentali',
    'Segnalano cose',
  importance:  Importance.max
);

class NotificationManager {

  // Creiamo un unica istanza della classe. Rendiamo il costruttore privato
  // Quindi nessuno puo' costruire la classe se non la classe stessa
  NotificationManager._();

  // Quindi la costruisco qui dentro tramite un singleton e la inizializzo
  static final NotificationManager _singleton = NotificationManager._();

  // Qui ritorno l'istanza singleton
  factory NotificationManager() => _singleton;

  bool _initialize = false;

  Future init() async {
    // Questo ci da la certezza che viene inizializzato una sola volta
    if(_initialize)
      return;

    final local = FlutterLocalNotificationsPlugin();
    await local.initialize(InitializationSettings(
      android: AndroidInitializationSettings (
        '@mipmap/ic_launcher'
      ),
      iOS: IOSInitializationSettings ()
    ), onSelectNotification: (payload) {
      final data = jsonDecode(payload);
    });

    if (Platform.isAndroid) {
      final android = local
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      await android.createNotificationChannel(mainChannel);
    }

    _initialize = true;
  }

  Future showLocalNotification(int id, DateTime date, String a, String b, String c, String d) async {
    final local = FlutterLocalNotificationsPlugin();

    String dataEvento = formatDate(date).toString();

    // Ogni notifica a schermo ha un id quindi quando creeremo una nuova
    // notifica dovremo assegnargli un id, con cancell all possiamo cancellarle
    // tutte. notifiche periodiche, ogni giorno, potremmo metterci un if
    // e con il timer del sistema operativo facciamo se presente evento
    await local.show (
      id, dataEvento, '$a',
      NotificationDetails(
        android:AndroidNotificationDetails(
         // Bisogna assegnare il canale di notifica
          mainChannel.id,
          mainChannel.name,
          mainChannel.description,
          importance: Importance.max,
          styleInformation: BigTextStyleInformation(
            'Scadenza contratto Printing $a per la stampante $c - $d '
                ' SN: $b '
          )
        )
      ),
      payload: jsonEncode({'title' : 'Notifica Locala',
      'body' : 'Corpo della Notifica'
      })
    );
  }

  formatDate (data) {
    var formatter = new DateFormat('dd-MM-yyyy');
    String formatDate = formatter.format(data);
    return formatDate;
  }

}
