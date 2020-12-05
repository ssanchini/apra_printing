import 'package:apra_printing/home_page.dart';
import 'package:apra_printing/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:apra_printing/bottom_bar_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
