import 'dart:math';

void SayHi() {
  print('Hello World!');
}

Future<void> time(int timing) async {
  int count = 0;
  for (int i = 0; i < 10; i++)
    await Future.delayed(Duration(seconds: timing), () {
      SayHi();
      print("${++count}");
    });
}

Future<int> randomNo() {
  return Future.delayed(Duration(seconds: 1), () {
    int genNo = Random().nextInt(5);
    if (genNo > 2) throw Exception("2 vanda thulo vayo");
    return genNo;
  });
}

void main() async {
// Error handling
  // Callback Style
  await randomNo().then((value) {
    print("Random number: $value");
  }).catchError((error) {
    print("Error caught from callback style. Error says: " + error.toString());
  });

// Synchronous style
  try {
    int randomInt = await randomNo();
    print("Random number: $randomInt");
  } catch (e) {
    print("Error caught synchronously. Error says: " + e.toString());
  }
}
