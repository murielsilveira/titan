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
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Headline(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Image.asset(
                    'assets/images/login-plant.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: <Widget>[
                    PrimaryButton(
                      'Login',
                      onPress: () {},
                    ),
                    SizedBox(height: 12),
                    Button(
                      'Register',
                      onPress: () {},
                    ),
                    SizedBox(height: 12),
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Text(
                        'Terms of service',
                        style: TextStyle(
                          color: Color.fromRGBO(216, 216, 216, 1),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
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
                  Color.fromRGBO(10, 196, 186, 1),
                  Color.fromRGBO(43, 218, 142, 1),
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
