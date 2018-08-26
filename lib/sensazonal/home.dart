import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SensazonalHome extends StatefulWidget {
  SensazonalHome({Key key}) : super(key: key);

  @override
  _SensazonalHomeState createState() => _SensazonalHomeState();
}

class _SensazonalHomeState extends State<SensazonalHome> {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

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
                if (snapshot.hasData) {
                  return GridView.count(
                    padding: const EdgeInsets.all(5.0),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                    childAspectRatio: (orientation == Orientation.portrait) ? 0.9 : 1.3,
                    children: snapshot.data.map((food) {
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

                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ]),
    );
  }
}

Future<List<Food>> fetchFoods() async {
  final response = await http
    .post('https://saturno-phoenix.herokuapp.com/graphiql', body: {"query": "query { foods { id name group months imageUrl } }"});

  if (response.statusCode != 200) {
    throw Exception('Failed to load foods');
  }

  print(response.body);
  return parseFoodsQuery(response.body);
}

List<Food> parseFoodsQuery(String payload) {
  if (payload == null || payload.isEmpty)
    return [];
  try {
    Map<String, dynamic> parsed = json.decode(payload);
    List<dynamic> foods = parsed["data"]["foods"];
    return foods.map((f) => Food.fromJson(f)).toList();
  } catch (e) {
    print(e);
    return [];
  }
}

class Food {
  final String id, name, group, imageUrl;
  final List<int> months;

  const Food({this.id, this.name, this.group, this.months, this.imageUrl});

  factory Food.fromJson(Map<String, dynamic> foodJson) {
    if (foodJson == null)
      return null;

    return Food(
      id: foodJson['id'],
      name: foodJson['name'],
      group: foodJson['group'],
      months: List<int>.from(foodJson['months'] ?? []),
      imageUrl: foodJson['imageUrl'],
    );
  }
}
