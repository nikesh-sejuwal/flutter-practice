class Animal {
  List<Animal> CreateAnimal = [];
  static int noOfAnimal = 0;
  String name;
  int legs;
  Animal({required this.name, required this.legs}) {
    noOfAnimal++;
  }
  void show() {
    print('I am a $name and I have $legs');
  }
}

void main() {
  Animal cow = Animal(name: 'Cow', legs: 4);
  Animal parrot = Animal(name: 'parrot', legs: 2);
  Animal elephant = Animal(name: 'Elephant', legs: 2);
  Animal dog = Animal(name: 'dog', legs: 4);
  Animal tiger = Animal(name: 'tiger', legs: 4);
  print("Total Animals: ${Animal.noOfAnimal}. and they are following");
  cow.show();
  parrot.show();
  elephant.show();
  dog.show();
  tiger.show();
}
