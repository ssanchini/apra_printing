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

  List selectedEvents = [];

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
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _portraitMode();
          } else {
            return _landscapeMode();
          }
        },
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _portraitMode() {
    return Selector<AppState, Map<DateTime, List<Printer>>>(
        selector: (_, state) => state.eventi,
        builder: (context, listaEventi, _) => Column(children: [
              Container(
                  child: TableCalendar(
                events: listaEventi,
                calendarStyle: CalendarStyle(selectedColor: Colors.blueAccent),
                startingDayOfWeek: StartingDayOfWeek.monday,
                initialCalendarFormat: CalendarFormat.month,
                onDaySelected: (date, events, holiday) {
                  print(date.toIso8601String());
                  setState(() {
                    selectedEvents = events;
                    print(events);
                  });
                },
                calendarController: _controller,
              )),
              const SizedBox(height: 8.0),
              Expanded(child: eventListConstruct()),
            ]));
  }

  Widget _landscapeMode() {
    return Selector<AppState, Map<DateTime, List<Printer>>>(
        selector: (_, state) => state.eventi,
        builder: (context, listaEventi, _) => Row(children: [
              Expanded(
                child: ListView(children: [
                  TableCalendar(
                    events: listaEventi,
                    calendarStyle:
                        CalendarStyle(selectedColor: Colors.blueAccent),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    initialCalendarFormat: CalendarFormat.twoWeeks,
                    onDaySelected: (date, events, holiday) {
                      print(date.toIso8601String());
                      setState(() {
                        selectedEvents = events;
                        print(events);
                      });
                    },
                    calendarController: _controller,
                  )
                ]),
              ),
              Expanded(child: eventListConstruct())
            ]));
  }

  Widget eventListConstruct() {
    return ListView(
      children: selectedEvents
          .map((e) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  title: Text("${e.serial_number}"),
                  subtitle:
                      Text("${e.rag_cliente} - ${e.marca} : ${e.modello}"),
                  onTap: () => e,
                ),
              ))
          .toList(),
    );
  }
}
