import 'dart:async';

import 'package:apra_printing/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: qui devo implementare l'initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('apra_logo.jpg'),
              ),
              // TODO: Qui sotto possono metterci una scritta di Loading
              /*
              Padding(padding: EdgeInsets.only(top: 20)),
              Text('LOADING...',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue
              ),
            ),*/
              // TODO: inserisco la rotella di carinamento in un pad a parte
              Padding(padding: EdgeInsets.only(top: 30.0)),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 3,
              )
            ],
          ),
        ));
  }

  // TODO: qui do i valori al timer e alla callback
  startTimer() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, goHome);
  }

  goHome() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => HomePage()
    ));
  }
}
