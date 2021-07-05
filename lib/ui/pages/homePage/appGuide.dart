import 'package:flutter/material.dart';

class AppGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8CADCA),
      appBar: AppBar(
        title:
        Text(
          'Feel',
          style: TextStyle(
            color: Color(0xFF8CADCA),
            fontSize: 30.0,
          ),
        ),
        backgroundColor: Colors.white,
        //leading: Icon(Icons.menu, color: Colors.green)
        iconTheme: IconThemeData(color: Color(0xFF4F747D)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
            Image.asset('1.JPG', height: MediaQuery.of(context).size.height / 4),

             Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text("This app created to help you learn more about mindfulness. Home page contains quotes to motivate you to stay mindful"
                      " Mindfulness section gives information about mindfulness and brings your attention to the moment."
                      " Un-guidedmeditation page helps you observe your thoughts and feelings."
                      " The final section helps you to reflect on yourself, emotions and thoughts"
                      "\n \n Stay Mindful!!"
                      "", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
