import 'package:flutter/material.dart';
import 'package:titan/bank/BankHome.dart';
import 'package:titan/counter.dart';
import 'package:titan/sensazonal/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 132, 19, 158),
      ),
      routes: {
        '/': (context) => BankHome(),
        '/sensazonal': (context) => SensazonalHome(),
        '/counter': (context) => CounterPage(),
        '/bank': (context) => BankHome(),
      },
    );
  }
}
