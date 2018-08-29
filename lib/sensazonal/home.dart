import 'package:flutter/material.dart';
import 'package:titan/sensazonal/core/food.dart';
import 'package:titan/sensazonal/gateways/food_gateway.dart';
import 'package:titan/sensazonal/widgets/food_list.dart';

class SensazonalHome extends StatefulWidget {
  SensazonalHome({Key key}) : super(key: key);

  @override
  _SensazonalHomeState createState() => _SensazonalHomeState();
}

class _SensazonalHomeState extends State<SensazonalHome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Sensazonal'),
      ),
      body: Column(children: [
        Expanded(
          child: SafeArea(
            child: FutureBuilder<List<Food>>(
              future: fetchFoods(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return FoodList(foods: snapshot.data);
              },
            ),
          ),
        ),
      ]),
    );
  }
}
