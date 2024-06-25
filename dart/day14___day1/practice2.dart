class Animal {
  String name;
  int legs;
  static int noOfAnimal = 0;
  int? horn;
  Animal({required this.name, required this.legs, this.horn}) {
    noOfAnimal++;
  }

  void show() {
    print('Animal ${name} has $legs legs and $horn horn');
  }

  void removeLegs() {
    if (legs > 1) {
      legs--;
      print('legs $legs after removal');
    }
  }

  void addLegs() {
    legs++;
    print("ADDED LEGS OF ANIMAL $name and new legs is $legs");
  }
}

void main() {
  var cow = Animal(name: 'cow', legs: 4, horn: 2);
  cow.removeLegs();
  cow.show();
  var elephant = Animal(name: "Elephant", legs: 4, horn: 0);
  elephant.addLegs();
  elephant.show();
  print('the total number of animal: ${Animal.noOfAnimal}');
}
