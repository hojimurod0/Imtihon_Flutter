import 'package:flutter/material.dart';
import 'package:imtihonim_2/pages/Drinkingwaterand.dart';

class HabitSelectionScreen extends StatefulWidget {
  @override
  _HabitSelectionScreenState createState() => _HabitSelectionScreenState();
}

class _HabitSelectionScreenState extends State<HabitSelectionScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isBottom = _scrollController.position.pixels != 0;
        if (isBottom) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4D57C8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: Color(0xFF4D57C8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose your first habit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 0),
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  String habitImage;
                  String habitText;

                  switch (index) {
                    case 0:
                      habitImage = 'assets/images/young.boy1.png';
                      habitText = 'Drinking water';
                      break;
                    case 1:
                      habitImage = 'assets/images/young.boy1.png';
                      habitText = 'Morning Walk';
                      break;
                    case 2:
                      habitImage = 'assets/images/young.boy1.png';
                      habitText = 'Drinking water';
                      break;
                    case 3:
                      habitImage = 'assets/images/young.boy1.png';
                      habitText = 'Morning Walk';
                      break;
                    case 4:
                      habitImage = 'assets/images/young.boy1.png';
                      habitText = 'Drinking water';
                      break;
                    case 5:
                      habitImage = 'assets/images/young.boy1.png';
                      habitText = 'Morning Walk';
                      break;
                    default:
                      habitImage = 'assets/images/young.boy1.png';
                      habitText = 'Drinking water';
                  }

                  return HabitCard(
                    habitImage: habitImage,
                    habitText: habitText,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => MyApp()),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.chevron_right),
        backgroundColor: Color(0xFF4D57C8),
      ),
    );
  }
}

class HabitCard extends StatelessWidget {
  final String habitImage;
  final String habitText;

  HabitCard({required this.habitImage, required this.habitText});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              habitImage,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10), // Spacer
          Text(
            habitText,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('This is the next page'),
      ),
    );
  }
}
