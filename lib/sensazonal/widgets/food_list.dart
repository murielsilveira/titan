import 'package:flutter/material.dart';
import 'package:titan/sensazonal/core/food.dart';

class FoodList extends StatelessWidget {
  final List<Food> foods;

  FoodList({this.foods});

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return GridView.count(
      padding: const EdgeInsets.all(5.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
      childAspectRatio: (orientation == Orientation.portrait) ? 0.9 : 1.3,
      children: foods.map((food) {
        return Card(
          child: Column(
            children: [
              Expanded(child: Image.network(food.imageUrl, fit: BoxFit.cover)),
              ListTile(
                title: Text(
                  food.name,
                  style: TextStyle(fontSize: 18.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        );
      }).toList(),
    );
  }
}
