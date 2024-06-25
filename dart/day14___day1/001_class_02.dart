import 'dart:math';
import 'dart:io';

class Animal {
  static List<Animal> animalList = [];
  String name;
  int legs;
  String sound;

  Animal({required this.name, required this.legs, this.sound = 'hmm'}) {
    animalList.add(this);
  }

  void Show() {
    print('Hi I am $name and I have $legs legs and I sound like $sound');
  }

  void removeLeg() {
    if (legs > 0) {
      legs--;
      print('leg is removed of $name and total legs: $legs');
    } else if (legs == 0) {
      animalList.remove(this);
      print('Zero legs of $name so remove this');
    }
  }

  void addLeg() {
    legs++;
    print('legs is added of $name and total legs will be $legs');
  }

  static void generateRandom() {
    print('Choose the action to be done:');
    print('1. Remove leg from random animal');
    print('2. Add leg to random animal');
    print('3. Add 5 legs leg to random animal');
    print('4. Add leg to animal');
    print('5. Remove leg from animal');
    print('choose action ');
    int choose = int.parse(stdin.readLineSync()!);
    int randomNum = Random().nextInt(animalList.length);
    switch (choose) {
      case 1:
        {
          animalList[randomNum].removeLeg();
          break;
        }
      case 2:
        {
          animalList[randomNum].addLeg();
          break;
        }
      case 3:
        {
          animalList[randomNum].legs = 5;
          break;
        }
      case 4:
        {
          animalList[5].addLeg();
        }
      case 5:
        {
          animalList[1].removeLeg();
        }

      default:
        print('hii');
    }
  }

  static void ShowList() {
    print('The list of  animals are of ${Animal.animalList.length}: ');
    for (int i = 0; i < Animal.animalList.length; i++) {
      animalList[i].Show();
    }
  }
}

void main() {
  Animal(name: 'cow', legs: 4, sound: 'mow');
  Animal(name: 'dog', legs: 4);
  Animal(name: 'hen', legs: 2);
  Animal(name: 'parrot', legs: 2);
  Animal(name: 'pig', legs: 4);
  Animal(name: 'snake', legs: 0, sound: 'cissssss');
  Animal.generateRandom();
  Animal.ShowList();
}
