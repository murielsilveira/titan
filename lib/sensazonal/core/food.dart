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
