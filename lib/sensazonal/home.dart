import 'package:flutter/material.dart';

class SensazonalHome extends StatefulWidget {
  SensazonalHome({Key key}) : super(key: key);

  @override
  _SensazonalHomeState createState() => _SensazonalHomeState();
}

class _SensazonalHomeState extends State<SensazonalHome> {
  final List<Food> _foods = [
    Food(id: '1', name: 'Pineapple', group: 'Fruit', months:[1, 3, 9, 10, 11, 12], imageUrl: 'https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/PINEAPPLE.imageset/PINEAPPLE%403x.jpg'),
    Food(id: '2', name: 'Star Fruit', group: 'Fruit', months:[1, 2, 6, 7, 8], imageUrl: 'https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/STAR_FRUIT.imageset/STAR_FRUIT%403x.jpg'),
    Food(id: '3', name: 'Green Coconut', group: 'Fruit', months:[1, 2, 3, 10, 11, 12], imageUrl: 'https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/GREEN_COCONUT.imageset/GREEN_COCONUT%403x.jpg'),
    Food(id: '4', name: 'Fig', group: 'Fruit', months:[1, 2, 3, 12], imageUrl: 'https://raw.githubusercontent.com/ronanrodrigo/Sensazonal/master/Sensazonal/System/Assets.xcassets/Content/FIG.imageset/FIG%403x.jpg'),
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
                style: TextStyle(fontSize: 18.0),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      );
    }).toList();

    return new Scaffold(
      appBar: AppBar(
        title: Text('Sensazonal'),
      ),
      body: Column(children: [
        Expanded(
          child: SafeArea(
            child: GridView.count(
              padding: const EdgeInsets.all(5.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
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
  final String id, name, group, imageUrl;
  final List<int> months;

  const Food({this.id, this.name, this.group, this.months, this.imageUrl});
}
