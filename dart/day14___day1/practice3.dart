class Animal {
  static List<Animal> animalList = [];
  String name;
  int leg;
  int horn;
  Animal({required this.name, required this.leg, this.horn = 2}) {
    animalList.add(this);
  }
  void show() {
    print('The animal is $name, it has $leg legs and $horn horns');
  }

  void addLegs() {
    leg++;
    print("Added legs to $name animal, and now legs are $leg");
  }

  void removeLegs() {
    leg--;
    if (leg == 0) {
      animalList.remove(this);
      print('AS NO legs, so removed this animal from list');
    }
    print("Remove legs from $name animal, and now legs are $leg");
  }

  static void showList() {
    print("THE LIST ARE \n");
    for (int i = 0; i < animalList.length; i++) {
      animalList[i].show();
    }
  }
}

void main() {
  Animal(name: 'cow', leg: 4);
  Animal(name: 'dog', leg: 4, horn: 0);
  Animal(name: 'lion', leg: 4, horn: 0);
  Animal(name: 'tiger', leg: 4, horn: 0);
  Animal(name: 'rhino', leg: 4, horn: 1);
  Animal(name: 'buffalo', leg: 4);
  Animal.animalList[2].leg = 5;
  Animal.animalList[1].addLegs();
  Animal.animalList[3].removeLegs();
  Animal.showList();
}
