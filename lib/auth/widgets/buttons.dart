import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
    this.text, {
    Key key,
    this.child,
    this.onPress,
  }) : super(key: key);

  final Widget child;
  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    String finalText = text == null ? '' : text;
    Widget finalChild = child == null ? Text(finalText) : child;

    return Container(
      constraints: BoxConstraints(
        maxWidth: 275.0,
        minHeight: 48.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(157, 163, 180, 0.2),
            offset: Offset(0.0, 1.5),
            blurRadius: 6.5,
          ),
        ],
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(child: finalChild),
        onPressed: onPress,
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
    this.text, {
    Key key,
    this.child,
    this.onPress,
  }) : super(key: key);

  final Widget child;
  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    String finalText = text == null ? '' : text;
    Widget finalChild = child == null ? Text(finalText) : child;

    return Container(
      constraints: const BoxConstraints(
        maxWidth: 275.0,
        minHeight: 48.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(157, 163, 180, 0.1),
            offset: Offset(0.0, 1.5),
            blurRadius: 6.5,
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(10, 196, 186, 1),
            Color.fromRGBO(43, 218, 142, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: FlatButton(
        textColor: Colors.white,
        splashColor: Colors.white.withAlpha(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(child: finalChild),
        onPressed: onPress,
      ),
    );
  }
}

class RaisedPrimaryButton extends StatelessWidget {
  const RaisedPrimaryButton(
    this.text, {
    Key key,
    this.child,
    this.onPress,
  }) : super(key: key);

  final Widget child;
  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    String finalText = text == null ? '' : text;
    Widget finalChild = child == null ? Text(finalText) : child;

    return RaisedButton(
      textColor: Colors.white,
      splashColor: Colors.white.withAlpha(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        child: Container(
          child: finalChild,
          alignment: Alignment.center,
          constraints: BoxConstraints(
            maxWidth: 275.0,
            minHeight: 48.0,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(10, 196, 186, 1),
              Color.fromRGBO(43, 218, 142, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      onPressed: onPress,
    );
  }
}
