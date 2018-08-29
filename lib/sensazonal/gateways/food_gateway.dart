import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:titan/sensazonal/core/food.dart';

Future<List<Food>> fetchFoods() async {
  final response = await http.post(
    'https://saturno-phoenix.herokuapp.com/graphiql',
    body: {"query": "query { foods { id name group months imageUrl } }"},
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to load foods');
  }

  print(response.body);
  return parseFoodsQuery(response.body);
}

List<Food> parseFoodsQuery(String payload) {
  if (payload == null || payload.isEmpty) {
    return [];
  }

  try {
    Map<String, dynamic> parsed = json.decode(payload);
    List<dynamic> foods = parsed["data"]["foods"];
    return foods.map((f) => Food.fromJson(f)).toList();
  } catch (e) {
    print(e);
    return [];
  }
}
