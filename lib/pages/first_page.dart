import 'package:flutter/material.dart';
import 'dart:async';
import 'package:imtihonim_2/pages/second_page.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

//! 1 sahifa

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondPage()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9DCEFF), Color(0xFF92A3FD)],
            
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Image.asset(
              'assets/images/image12.png', 
              fit: BoxFit.cover, // ! o'lchami
            ),
          ],
        ),
      ),
    );
  }
}
