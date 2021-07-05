import 'package:flutter/material.dart';

//the class builds the mindfulness page with the swipe effect

class MindfulnessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Page1(),
        Page2(),
        Page3(),
        Page4(),
        Page5(),
        Page6(),

      ],
      scrollDirection: Axis.horizontal,
      pageSnapping: false,
      physics: BouncingScrollPhysics(),
      onPageChanged: (number) {
        print("page number is " + number.toString());
      },
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF8CADCA), width: 4),
          borderRadius: BorderRadius.all(Radius.circular(60)),
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          children: [
            //Flexible(child: Center(child: SizedBox(height: MediaQuery.of(context).size.height / 20))),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Mindfulness is the ability to become fully present with our thoughts, feelings and daily experiences without any judgement but curiosity.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            //Flexible(child: SizedBox(height: MediaQuery.of(context).size.height / 1000)),
         ],
        ),
      ),
    );
    //color: Colors.red,
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF8CADCA), width: 4),
          borderRadius: BorderRadius.all(Radius.circular(60)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height / 5),
            //Flexible(child: Center(child: SizedBox(height: MediaQuery.of(context).size.height / 15))),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "It is about watching our thoughts coming up and leave like a short movie. It is the feeling of becoming an observer of our minds.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            // color: Colors.green,
            // Flexible(child: SizedBox(height: MediaQuery.of(context).size.height / 100)),
          ],
        ),
      ),
    );
    //color: Colors.red,
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF8CADCA), width: 4),
          borderRadius: BorderRadius.all(Radius.circular(60)),
          color: Colors.white,
        ),
        child: Column(
          key: ValueKey("column3"),
          children: [
            //  SizedBox(height: MediaQuery.of(context).size.height / 5),
            Flexible(
              child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Text(
                        "Allow yourself to stay here and now, not in the anxiety of the future or regrets of the past. Cherish the moment and believe everything will work out as they supposed to, whether you worry or not.",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        key: ValueKey("text3"),
                      ),
                    ),
                  )
                // color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
    //color: Colors.red,
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        key: ValueKey("container4"),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF8CADCA), width: 4),
          borderRadius: BorderRadius.all(Radius.circular(60)),
          color: Colors.white,
        ),
        child: Column(
          key: ValueKey("column4"),
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Text(
                      "Focus on an object now, like a book or mug and be present with it. As if it is the first time you see it, recognize its colours, shape and texture with a curiosity.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      key: ValueKey("text4"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //color: Colors.red,
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        key: ValueKey("container4"),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF8CADCA), width: 4),
          borderRadius: BorderRadius.all(Radius.circular(60)),
          color: Colors.white,
        ),
        child: Column(
          key: ValueKey("column4"),
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Text(
                      "Now, hold the object in your hands and notice its weight, texture and temperature.",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      key: ValueKey("text4"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //color: Colors.red,
  }
}

class Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        key: ValueKey("container5"),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFF8CADCA), width: 4),
          borderRadius: BorderRadius.all(Radius.circular(60)),
        ),
        child: Column(
          key: ValueKey("column5"),
          children: [
            //SizedBox(height: MediaQuery.of(context).size.height / 5),
            Flexible(
              child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Text(
                        "Not being present with ourselves and our surroundings makes us feel more and more stressed and worried. All we have in our hands is the present moment, feel and live it.",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        key: ValueKey("text5"),
                      ),
                    ),
                  )
                // color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
    //color: Colors.red,
  }
}

class Page7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        key: ValueKey("container6"),
        decoration: BoxDecoration(
          //color: Colors.white,
          border: Border.all(color: Color(0xFF8CADCA), width: 4),
          borderRadius: BorderRadius.all(Radius.circular(60)),
          color: Colors.white,
        ),
        child: Column(
          key: ValueKey("column6"),
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Text(
                        "Anytime you need to escape from your mind, I'll be here to guide you to the present moment. Lots of love. ",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        key: ValueKey("text6"),
                      ),
                    )
                  // color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //color: Colors.red,
  }
}