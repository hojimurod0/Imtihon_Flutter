import 'package:flutter/material.dart';
import 'sixty_page.dart'; // 'SixtyPage' sahifasini import qilamiz

class FiftyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/firstgirl.png', 
                // width: 420,
                // height: 420,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 34),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Track Your Goal",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
             const  SizedBox(height: 20),
             const  Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    """Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals""",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SixtyPage()),
          );
        },

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor:const  Color(0xFF7583CA),
        child:const  Icon(Icons.chevron_right),

    
      ),
    );
  }
}
