import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:titan/auth/widgets/buttons.dart';
import 'package:titan/auth/widgets/gradient_text.dart';

class LoginHomePage extends StatefulWidget {
  LoginHomePage({Key key}) : super(key: key);

  @override
  _LoginHomePageState createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          child: Column(
            children: [
              Headline(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Image.asset('assets/images/login-plant.png'),
              ),
              PrimaryButton('Login'),
              Button('Register'),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  'Terms of service',
                  style: TextStyle(
                    color: const Color.fromRGBO(216, 216, 216, 1),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Home.',
              style: TextStyle(fontSize: 28),
            ),
            Container(width: 10),
            GradientText(
              'Greener.',
              gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(10, 196, 186, 1),
                  const Color.fromRGBO(43, 218, 142, 1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              style: TextStyle(fontSize: 28),
            ),
          ],
        ),
        Container(height: 10),
        Text(
          'Enjoy the experience.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
