import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:apra_printing/model/appState.dart';

import 'bottom_bar_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Building $runtimeType');

    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset(
              'images/apra_logo.jpg',
              width: 300,
            ),
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
            backgroundColor: Colors.blue,
            strokeWidth: 3,
          )
        ],
      ),
    ));
  }

  @override
  void initState() {
    context.read<AppState>().init(context).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomBarPage()));
    });
  }
}
