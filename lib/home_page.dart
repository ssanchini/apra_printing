import 'package:apra_printing/main.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomeStatePage createState() => _HomeStatePage();
}

class _HomeStatePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('This is Home Page'),
      ),

    );
  }
}


/*******************************************************************************
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calendar_page.dart';
import 'customers_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO; imposto l'indice a 0 per la navigazione tra le pagine
  int _indiceCorrente = 0;

  final _children = [
    HomePage(),
    CalendarPage(),
    CustomersPage()
  ];

  // TODO: qui assegno l'indice in base al pulsante selezionato
  void _pushedButton(int indice) {
    setState(() {
      _indiceCorrente = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        body: _children[_indiceCorrente],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _indiceCorrente,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  // ignore: deprecated_member_use
                  title: Text('Home'),
                  backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  // ignore: deprecated_member_use
                  title: Text('Customers'),
                  backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  // ignore: deprecated_member_use
                  title: Text('Calendar'),
                  backgroundColor: Colors.blue
              ),
            ],
        )
    );
  }
}




 ************************************/