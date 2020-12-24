import 'package:apra_printing/model/appState.dart';
import 'package:flutter/material.dart';
import 'package:apra_printing/pages/splash_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
        create: (context) => AppState(),
        child: MaterialApp(
          home: SplashScreen(),
        ));
  }
}
