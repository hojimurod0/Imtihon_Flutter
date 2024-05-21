import 'package:flutter/material.dart';
import 'package:imtihonim_2/pages/Drinkingwaterand.dart';
import 'package:imtihonim_2/pages/Morningselection1.dart';
import 'package:imtihonim_2/pages/choosehabit5.dart';
import 'package:imtihonim_2/pages/eight_page.dart';
import 'package:imtihonim_2/pages/fifty_page.dart';
import 'package:imtihonim_2/pages/first_page.dart';
import 'package:imtihonim_2/pages/3pg/login_page.dart';
import 'package:imtihonim_2/pages/3pg/register_page.dart';
import 'package:imtihonim_2/pages/night_selection2.dart';

import 'package:imtihonim_2/pages/second_page.dart';
import 'package:imtihonim_2/pages/seven_page.dart';
import 'package:imtihonim_2/pages/sixty_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageView(),
      // home: SixtyPage(),
    );
  }
}

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          FirstPage(),
          SecondPage(),
          LoginPage(),
          RegisterPage(),
          FiftyPage(),
          SixtyPage(),
          SevenPage(),
          EightPage(),
          Morningselection(),
          NightSelection(),
          HabitSelectionScreen(),
          MyApp(),
        ],
      ),
    );
  }
}
