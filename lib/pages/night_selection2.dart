import 'package:flutter/material.dart';
import 'package:imtihonim_2/pages/proctasive.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NightSelection(),
    );
  }
}




class NightSelection extends StatefulWidget {
  @override
  _NightSelectionState createState() => _NightSelectionState();
}



class _NightSelectionState extends State<NightSelection> {
  int selectedHour = 11;
  int selectedMinute = 30;
  bool isAm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4D57C8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 130),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "When do you want to reflect on your day",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 70),
            Image(
              image: AssetImage('assets/images/oy.png'),
              width: 500,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildNumberPicker(
                        context,
                        selectedValue: selectedHour,
                        maxValue: 12,
                        onChanged: (value) {
                          setState(() {
                            selectedHour = value;
                          });
                        },
                      ),
                      Text(
                        ":",
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                      buildNumberPicker(
                        context,
                        selectedValue: selectedMinute,
                        maxValue: 59,
                        onChanged: (value) {
                          setState(() {
                            selectedMinute = value;
                          });
                        },
                      ),
                      buildAmPmPicker(),
                    ],
                  ),
                  SizedBox(height: 20), // Adjust the spacing as needed
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProcrastitePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text('GET STARTED'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNumberPicker(BuildContext context,
      {required int selectedValue,
      required int maxValue,
      required ValueChanged<int> onChanged}) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_drop_up, color: Colors.white),
          onPressed: () {
            setState(() {
              if (selectedValue < maxValue) {
                selectedValue++;
                onChanged(selectedValue);
              }
            });
          },
        ),
        Text(
          selectedValue.toString().padLeft(2, '0'),
          style: const TextStyle(fontSize: 32.0, color: Colors.white),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          onPressed: () {
            setState(() {
              if (selectedValue > 1) {
                selectedValue--;
                onChanged(selectedValue);
              }
            });
          },
        ),
      ],
    );
  }

  Widget buildAmPmPicker() {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_drop_up, color: Colors.white),
          onPressed: () {
            setState(() {
              isAm = !isAm;
            });
          },
        ),
        Text(
          isAm ? 'AM' : 'PM',
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
        IconButton(
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          onPressed: () {
            setState(() {
              isAm = !isAm;
            });
          },
        ),
      ],
    );
  }
}
