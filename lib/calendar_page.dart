import 'package:apra_printing/main.dart';
import 'package:flutter/material.dart';


class CalendarPage extends StatefulWidget {
  @override
  _CalendarStatePage createState() => _CalendarStatePage();
}

class _CalendarStatePage extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(
        child: Text('This is Calendar Page'),
      ),

    );
  }
}

