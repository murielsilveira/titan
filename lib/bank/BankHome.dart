import 'package:flutter/material.dart';

class BankHome extends StatefulWidget {
  BankHome({Key key}) : super(key: key);

  @override
  _BankHomeState createState() => _BankHomeState();
}

class _BankHomeState extends State<BankHome> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation animation;
  Animation<Offset> position;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);
    position = Tween<Offset>(
      begin: const Offset(3.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(animation);

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Bank'),
      ),
      body: Column(children: [
        Expanded(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Text('asdf'),
                Expanded(
                  child: SlideTransition(
                    position: position,
                    child: Container(
                      color: Colors.red,
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text('Bank!'),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                Expanded(
                  child: SlideTransition(
                    position: position,
                    child: Container(
                      color: Colors.red,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text('Bank!'),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
