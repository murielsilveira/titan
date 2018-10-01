import 'package:flutter/material.dart';

class BankHome extends StatefulWidget {
  BankHome({Key key}) : super(key: key);

  @override
  _BankHomeState createState() => _BankHomeState();
}

class _BankHomeState extends State<BankHome> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation animation;
  Animation<Offset> mainPosition;
  Animation<Offset> bottonPosition;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);
    mainPosition = Tween<Offset>(
      begin: const Offset(0.5, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(animation);
    bottonPosition = Tween<Offset>(
      begin: const Offset(0.9, 0.0),
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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: null,
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Column(
                children: [
                  TopBar(),
                  Expanded(
                    child: SlideTransition(
                      position: mainPosition,
                      child: MainBar(),
                    ),
                  ),
                  Container(
                    height: 130.0,
                    child: SlideTransition(
                      position: bottonPosition,
                      child: BottomBar(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        right: 8.0,
        left: 8.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet,
                color: Colors.white,
              ),
              Container(width: 5.0),
              Text(
                'John',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            padding: EdgeInsets.zero,
            onPressed: () {
              print('open menu');
            },
          ),
        ],
      ),
    );
  }
}

class MainBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
//        color: Colors.red,
        constraints: BoxConstraints(
          maxHeight: 400.0,
        ),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 30,
          itemBuilder: (context, index) {
            return MainItem();
          },
        ),
      ),
    );
  }
}

class MainItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            color: Colors.black54,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'FATURA ATUAL',
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'R\$ 0,00',
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: 30.0,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Limite disponível',
                                      ),
                                      TextSpan(
                                        text: ' R\$ 504.771.231,12',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      width: 8.0,
                      height: 20.0,
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.grey.withOpacity(0.1),
              padding: const EdgeInsets.only(
                top: 30.0,
                bottom: 30.0,
                right: 20.0,
                left: 20.0,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.tap_and_play,
                    color: Colors.black54,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 10.0,
                        left: 10.0,
                      ),
                      child: Text(
                        'Compra mais recente em Apple Inc. no valor de R\$ 1.000.000,00 em 29 FEV 18',
                        style: TextStyle(color: Colors.black.withOpacity(0.95)),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 35.0,
          bottom: 8.0,
          right: 16.0,
          left: 16.0,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            BottomItem(
              icon: Icons.person_add,
              text: 'Indicar amigos',
            ),
            Container(width: 5.0),
            BottomItem(
              icon: Icons.add_to_photos,
              text: 'Cobrar',
            ),
            Container(width: 5.0),
            BottomItem(
              icon: Icons.attach_money,
              text: 'Depositar',
            ),
            Container(width: 5.0),
            BottomItem(
              icon: Icons.money_off,
              text: 'Transferir',
            ),
            Container(width: 5.0),
            BottomItem(
              icon: Icons.settings,
              text: 'Ajustar limite',
            ),
            Container(width: 5.0),
            BottomItem(
              icon: Icons.lock_open,
              text: 'Desbloquear cartão',
            ),
          ],
        ),
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  final IconData icon;
  final String text;

  BottomItem({
    this.icon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: 85.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                this.icon,
                color: Colors.white,
              ),
              Text(
                this.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
