import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: proj1(),
  ));
}

class proj1 extends StatelessWidget {
  const proj1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 400,
            height: 783,
            color: Colors.white,
            child: Stack(
              children: [
                Align(
                  child: upperContainer(),
                  // child: Container(),
                ),
                Align(
                  child: middleContainer(),
                ),
                lowerContainer()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class lowerContainer extends StatelessWidget {
  const lowerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 400,
        height: 320,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.refresh_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Text(
                      'Play Again',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Text(
                      'Review Answer',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Text(
                      'Share Score',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.picture_as_pdf_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Text(
                      'Generate PDF',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.leaderboard_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Text(
                      'Share Score',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class middleContainer extends StatelessWidget {
  const middleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 130,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.purple,
              spreadRadius: 2,
              blurRadius: 7,
            )
          ]),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 20, top: 10, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon(
                //   Icons.circle,
                //   color: Colors.purple,
                //   size: 12,
                // ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3, bottom: 20),
                      child: Icon(
                        Icons.circle,
                        color: Colors.purple,
                        size: 10,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '100%',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Completed',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3, bottom: 20),
                      child: Icon(
                        Icons.circle,
                        color: Colors.purple,
                        size: 10,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '20',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'New Question',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon(
                //   Icons.circle,
                //   color: Colors.purple,
                //   size: 12,
                // ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3, bottom: 20),
                      child: Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 10,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '13',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Correct',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3, bottom: 20),
                      child: Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 45.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '07',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Wrong',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class upperContainer extends StatelessWidget {
  const upperContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.purple.shade600,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 3,
              color: Colors.purple.shade500,
            ),
          ),
          child: Stack(
            children: [
              Align(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade400,
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Align(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  height: 155,
                  width: 155,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade300,
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Align(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(201, 255, 255, 255),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 130,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Your Score',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '150',
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2, top: 8),
                            child: Text(
                              'pt',
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: 125,
                  width: 125,
                ),
              ),
              Positioned(
                top: 0,
                left: -90,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade500,
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Positioned(
                top: -110,
                left: 100,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade500,
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 80,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade500,
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Positioned(
                bottom: 140,
                right: -100,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade500,
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                left: 10,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
