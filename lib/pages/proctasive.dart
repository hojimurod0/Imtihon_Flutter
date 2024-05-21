import 'package:flutter/material.dart';
import 'package:imtihonim_2/pages/choosehabit5.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProcrastitePage(),
    );
  }
}

class ProcrastitePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF4D57C8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100),
              Text(
                "What do you hope to achieve with Main Habit",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 470),
              buildOptionButton(context, "Yes and I'm ready to change that",
                  'assets/images/halfsun.png'),
              SizedBox(height: 20),
              buildOptionButton(
                  context,
                  "No, I easily finish the tasks at hand",
                  'assets/images/treess.png'),
              SizedBox(height: 20),
              buildOptionButton(
                  context, "Not ready to answer", 'assets/images/treess.png'),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HabitSelectionScreen()),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.chevron_right),
        backgroundColor: Color(0xFF7889DF),
      ),
    );
  }

  Widget buildOptionButton(
      BuildContext context, String text, String imagePath) {
    return Container(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Color(0xFF7889DF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Image.asset(imagePath, height: 30),
          ],
        ),
      ),
    );
  }
}
