import 'package:flutter/material.dart';
import 'package:titan/counter.dart';
import 'package:titan/sensazonal/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: {
        '/': (context) => SensazonalHome(),
        '/counter': (context) => CounterPage(),
      },
    );
  }
}
