import 'package:flutter/material.dart';
import 'package:titan/sensazonal/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new SensazonalHome(),
    );
  }
}
