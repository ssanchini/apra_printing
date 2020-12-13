import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarPage extends StatefulWidget {
  @override
  _CalendarStatePage createState() => _CalendarStatePage();
}

class _CalendarStatePage extends State<CalendarPage> {

   CalendarController _controller;

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
          //leading: Image.asset('aapra.jpg', width: 200, ),//Icon(Icons.arrow_forward_ios),
          title: Text('Calendar'),
          //title: Image.asset('apra_no_back.png' , width: 125,),
        ),
    body:
        TableCalendar(
          calendarStyle:
            CalendarStyle(selectedColor: Colors.blueAccent ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: (date, events, holiday) {
                print(date.toIso8601String());
            },

            calendarController: _controller,)
    );
  }
}

/*******
builders: CalendarBuilders (
selectedDayBuilder: (context,date, events) =>
Container(
alignment: Alignment.center,
decoration: BoxDecoration(
color: Theme.of(context).primaryColor,
shape: BoxShape.circle,
),
child: Text(date.day.toString(),
style: TextStyle(color: Colors.white),
),
),

),   ***/