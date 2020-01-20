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
    Widget finalChild = child != null ? child : Text(finalText);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 275.0,
          minHeight: 48.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(157, 163, 180, 0.2),
              offset: Offset(0.0, 1.5),
              blurRadius: 6.5,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Center(
              child: finalChild,
            ),
            onTap: onPress,
          ),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  // should text be a Text component and just the style be overwritten?
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
    Widget finalChild = child == null
        ? Text(finalText, style: TextStyle(color: Colors.white))
        : child;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 275.0,
          minHeight: 48.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(157, 163, 180, 0.1),
              offset: Offset(0.0, 1.5),
              blurRadius: 6.5,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              const Color.fromRGBO(10, 196, 186, 1),
              const Color.fromRGBO(43, 218, 142, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white.withAlpha(50),
            child: Center(
              child: finalChild,
            ),
            onTap: onPress,
          ),
        ),
      ),
    );
  }
}
