Future<void> table() async {
  int time = 0;
  for (int i = 1; i <= 10; i++) {
    time = time + 500;
    await Future.delayed(Duration(milliseconds: time), () {
      print('\t\t\t\t${time / 1000} seconds');
      // print('Hello');
      print('\n\nMultiplication of $i');
      for (int j = 1; j <= 10; j++) {
        print("$i * $j = ${i * j}");
      }
    });
  }
}

void main() {
  table();
}
