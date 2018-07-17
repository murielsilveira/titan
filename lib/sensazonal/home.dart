import 'package:flutter/material.dart';

class SensazonalHome extends StatefulWidget {
  SensazonalHome({Key key}) : super(key: key);

  @override
  _SensazonalHomeState createState() => new _SensazonalHomeState();
}

class _SensazonalHomeState extends State<SensazonalHome> {
  final List<Food> _foods = [
    Food("Pineapple", "Fruit", [1, 3, 9, 10, 11, 12], "https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/PINEAPPLE.imageset/PINEAPPLE%403x.jpg"),
    Food("Star Fruit", "Fruit", [1, 2, 6, 7, 8], "https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/STAR_FRUIT.imageset/STAR_FRUIT%403x.jpg"),
    Food("Green Coconut", "Fruit", [1, 2, 3, 10, 11, 12], "https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/GREEN_COCONUT.imageset/GREEN_COCONUT%403x.jpg"),
    Food("Fig", "Fruit", [1, 2, 3, 12], "https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/FIG.imageset/FIG%403x.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    final tiles = _foods.map((food) {
      return Card(
        child: Column(
          children: [
            Expanded(child: Image.network(food.imageUrl, fit: BoxFit.cover)),
            ListTile(
              title: Text(
                food.name,
                style: const TextStyle(fontSize: 18.0),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      );
    }).toList();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sensazonal"),
      ),
      body: new Column(children: [
        Expanded(
          child: SafeArea(
            child: GridView.count(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(5.0),
              childAspectRatio: (orientation == Orientation.portrait) ? 0.9 : 1.3,
              children: tiles,
            ),
          ),
        ),
      ]),
    );
  }
}

class Food {
  final String name, group, imageUrl;
  final List<int> months;

  const Food(this.name, this.group, this.months, this.imageUrl);
}
