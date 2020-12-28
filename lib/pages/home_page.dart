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
      body:
        UpsideImage(),
        backgroundColor: Colors.white,

    );
  }
}

class  UpsideImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/apra_logo.jpg', alignment: Alignment.bottomLeft, width: 250),
    );
  }
}

