class Fruit {
  String name;
  String color;
  bool? isEdible = true;

  Fruit({required this.name, required this.color, this.isEdible});

  static Fruit parseFromJSON(Map<String, dynamic> rawFruit) {
    return Fruit(
        name: rawFruit['name'],
        color: rawFruit['color'],
        isEdible: rawFruit['isEdible']);
  }
}

List<Map<String, dynamic>> fruits = [
  {'name': 'Apple', 'color': 'Red', 'isEdible': true},
  {'name': 'Banana', 'color': 'Yellow', 'isEdible': true},
  {'name': 'Lemon', 'color': 'Yellow', 'isEdible': true},
  {'name': 'Blueberry', 'color': 'Blue', 'isEdible': true},
  {'name': 'Grape', 'color': 'Purple', 'isEdible': true},
  {'name': 'Tomato', 'color': 'Red', 'isEdible': true}
];

void main() {
  List<Fruit> fruitsObj = (fruits).map((e) => Fruit.parseFromJSON(e)).toList();
  print(fruitsObj.runtimeType);

  for (var fruit in fruitsObj) {
    print(
        "name: ${fruit.name} color: ${fruit.color} isEdible: ${fruit.isEdible} ");
  }
}

// List<String> colors = [];
// List<Map<String, dynamic>> newFruits = [];

// void main() {
//   for (int i = 0; i < fruits.length; i++) {
//     newFruits.add(fruits[i]);
//   }
//   print(newFruits);
//   print(newFruits.runtimeType);

//   var response = (newFruits).map((e) => Fruit.perseFromJSON(e)).toList();
//   print(response.runtimeType);
// }

// class Fruit {
//   String name;
//   String color;
//   bool? isEdible = true;

//   Fruit({required this.name, required this.color, this.isEdible});

//   static Fruit parseFromJSON(Map<String, dynamic> rawFruits) {
//     return Fruit(
//       name: rawFruits['name'],
//       color: rawFruits['color'],
//       isEdible: rawFruits['isEdible'],
//     );
//   }

  // @override
  // String toString() {
  //   return 'Fruit(name: $name, color: $color, isEdible: $isEdible)';
  // }
// }

// List<Map<String, dynamic>> fruits = [
//   {'name': 'Apple', 'color': 'Red', 'isEdible': true},
//   {'name': 'Banana', 'color': 'Yellow', 'isEdible': true},
//   {'name': 'Lemon', 'color': 'Yellow', 'isEdible': true},
//   {'name': 'Blueberry', 'color': 'Blue', 'isEdible': true},
//   {'name': 'Grape', 'color': 'Purple', 'isEdible': true},
//   {'name': 'Tomato', 'color': 'Red', 'isEdible': true}
// ];

// void main() {
//   // Convert the list of maps to a list of Fruit objects
//   List<Fruit> fruitObjects = fruits.map((e) => Fruit.parseFromJSON(e)).toList();

//   // Print the list of Fruit objects
//   print(fruitObjects);
//   print(fruitObjects.runtimeType);

//   // Extract and print individual properties
//   for (var fruit in fruitObjects) {
//     print(
//         'Name: ${fruit.name}, Color: ${fruit.color}, IsEdible: ${fruit.isEdible}');
//   }
// }
