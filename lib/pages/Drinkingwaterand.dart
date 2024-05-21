import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  DrinkingPage createState() => DrinkingPage();
}

class DrinkingPage extends State<MyApp> {
  int _dailyGoal = 5;
  int _weeklyGoal = 35;
  int _monthlyGoal = 150;
  List<bool> _daysOfWeek = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF4D57C8, ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // // SizedBox(
                // // height: 20),
                
                Image.asset('assets/images/water.png'),
                SizedBox(height: 20),
                Text('Set your goals'),
                SizedBox(height: 10),
                _buildGoalRow('Daily', _dailyGoal, _updateDailyGoal),
                SizedBox(height: 10),
                _buildGoalRow('Weekly', _weeklyGoal, _updateWeeklyGoal),
                SizedBox(height: 10),
                _buildGoalRow('Monthly', _monthlyGoal, _updateMonthlyGoal),
                SizedBox(height: 20),
                _buildWeeklyRepeatSection(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                 
                  },
                  child: Text('CONTINUE'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoalRow(String label, int value, Function(int) onUpdate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => onUpdate(value - 1),
          child: Text('-'),
        ),
        SizedBox(width: 10),
        Text('$label: $value glasses'),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => onUpdate(value + 1),
          child: Text('+'),
        ),
      ],
    );
  }

  Widget _buildWeeklyRepeatSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 7; i++)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: GestureDetector(
                  onTap: () => _toggleWeekday(i),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: _daysOfWeek[i] ? Colors.blue : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        ['S', 'M', 'T', 'W', 'T', 'F', 'S'][i],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  void _updateDailyGoal(int value) {
    setState(() {
      _dailyGoal = value.clamp(1, 100);
    });
  }

  void _updateWeeklyGoal(int value) {
    setState(() {
      _weeklyGoal = value.clamp(7, 1000);
    });
  }

  void _updateMonthlyGoal(int value) {
    setState(() {
      _monthlyGoal = value.clamp(30, 10000);
    });
  }

  void _toggleWeekday(int index) {
    setState(() {
      _daysOfWeek[index] = !_daysOfWeek[index];
    });
  }
}
