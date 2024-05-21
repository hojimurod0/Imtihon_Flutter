import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imtihonim_2/pages/night_selection2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Morningselection(), // Bosh sahifani Morningselectionga sozlaymiz
    );
  }
}

class Morningselection extends StatefulWidget {
  @override
  _MorningselectionState createState() => _MorningselectionState();
}

class _MorningselectionState extends State<Morningselection> {


  
  //!   o'zgaruvchilar
  int tanlanganSoat = 7;
  int tanlanganDaqiqa = 30;
  bool amHolatida = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF8E97FD), // Fon rangi
      body: Stack(
        children: [
          Positioned(
            top: 100,
            right: 20,
            left: 20,
            child: Text(
              "Whats time do you usually wake up?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 120,
            child: Image.asset(
              "assets/images/sun.png",
              fit: BoxFit.cover,
            ),
            width: width,
            height: 500,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 350,
              width: width,
              color: Colors.blue[900],
              child: Column(
                children: [
                  SizedBox(height: 50), // Bo'sh joy
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Soat va daqiqani tanlash uchun vidjetlar
                      buildNumberPicker(
                        context,
                        tanlanganQiymat: tanlanganSoat,
                        maksimalQiymat: 12,
                        ozgartirishFunksiyasi: (qiymat) {
                          setState(() {
                            tanlanganSoat = qiymat;
                          });
                        },
                      ),
                      Text(
                        ":", // Nuqtachka ajratuvchi
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                      buildNumberPicker(
                        context,
                        tanlanganQiymat: tanlanganDaqiqa,
                        maksimalQiymat: 59,
                        ozgartirishFunksiyasi: (qiymat) {
                          setState(() {
                            tanlanganDaqiqa = qiymat;
                          });
                        },
                      ),
                      buildAmPmPicker(),
                    ],
                  ),
                  SizedBox(height: 20), // Bo'sh joy
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NightSelection()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text('BOSH QILING'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNumberPicker(BuildContext context,
      {required int tanlanganQiymat,
      required int maksimalQiymat,
      required ValueChanged<int> ozgartirishFunksiyasi}) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_drop_up, color: Colors.white),
          onPressed: () {
            setState(() {
              if (tanlanganQiymat < maksimalQiymat) {
                tanlanganQiymat++;
                ozgartirishFunksiyasi(tanlanganQiymat);
              }
            });
          },
        ),
        Text(
          tanlanganQiymat.toString().padLeft(2, '0'),
          style: TextStyle(fontSize: 32.0, color: Colors.white),
        ),
        IconButton(
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          onPressed: () {
            setState(() {
              if (tanlanganQiymat > 0) {
                tanlanganQiymat--;
                ozgartirishFunksiyasi(tanlanganQiymat);
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
              amHolatida = !amHolatida;
            });
          },
        ),
        Text(
          amHolatida ? 'AM' : 'PM',
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
        IconButton(
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          onPressed: () {
            setState(() {
              amHolatida = !amHolatida;
            });
          },
        ),
      ],
    );
  }
}
