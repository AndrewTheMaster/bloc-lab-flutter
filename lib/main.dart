import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 30),
                        SizedBox(width: 10),
                        Text(
                          "Flutter Challenge",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'CustomFont',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Image.network(
                      'https://avatars.mds.yandex.net/i?id=2f158ec69b737345ec738f83a1f45023_l-5275663-images-thumbs&n=13',
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Complete all labs by the end of this week, challenge accepted.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Accept Challenge"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}