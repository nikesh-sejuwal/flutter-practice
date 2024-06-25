import 'dart:io';

void main() {
  print("Enter your name: \t");
  var name = stdin.readLineSync();
  print("Enter the number:");
  var num = stdin.readLineSync();
  print("Welcome Mr $name. You are welcome to our class. $num");
}
