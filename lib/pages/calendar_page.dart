import 'package:apra_printing/model/appState.dart';
import 'package:apra_printing/model/printer.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:provider/provider.dart';


class CalendarPage extends StatefulWidget {
  @override
  _CalendarStatePage createState() => _CalendarStatePage();
}

class _CalendarStatePage extends State<CalendarPage> {

  CalendarController _controller;
  final current = DateTime.now();

  final Map<DateTime, List<Printer>> _eventi = {};


  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Calendar'),
        ),
        body: Selector<AppState, List<Printer>>(
            selector: (_, state) => state.printersList,
            builder: (context, list, _) {
              Map.fromIterable(list, key: (v) => v.fineContratto, value: (v) => " $v.ragione_sociale $v.serial_number" );
              debugPrint('Carico gli eventi');
              return TableCalendar(
                //events: ,
                calendarStyle:
                CalendarStyle(selectedColor: Colors.blueAccent),
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (date, events, holiday) {
                  print(date.toIso8601String());
                },

                calendarController: _controller,);
            }


        )
    );
  }
}
