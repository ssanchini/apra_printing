import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
            children: <Widget>[
              Image.asset('apra_logo.jpg',
                  alignment: Alignment.topLeft, width: 300),
            ],
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.people_alt,
                  color: Colors.white,
                  size: 35,
                ),
                label: "Customers",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                  label: 'Calendar'),
            ],
            backgroundColor: Colors.lightBlue,
          )),
    );
  }
}
