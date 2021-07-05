import 'dart:math';
import 'package:flutter/material.dart';

//
// This class creates the home page
//

class HomePage extends StatelessWidget {
 var quotesList = [
 "\"The present moment is filled with joy and happiness. If you are attentive, you will see it.\" \n \n \n  ~Thich Nhat Hahn",
 "\"Wherever you are, be there totally.\"\n \n \n  ~Eckhart Tolle",
 "\"Be happy in the moment, that's enough. Each moment is all we need, not more.\"\n \n \n ~Mother Theresa",
 "\"Feelings come and go like clouds in a windy sky. Conscious breathing is my anchor.\"\n \n \n ~Thích Nhất Hạnh",
 "\"We have only now, only this single eternal moment opening and unfolding before us, day and night.\"\n \n \n ~Jack Kornfield",
 "\"The only way to live is by accepting each minute as an unrepeatable miracle.\"\n \n \n ~Tara Brach",
 "\"Mindfulness isn’t difficult, we just need to remember to do it.\"\n \n \n ~Sharon Salzberg",
 "\"Every time we become aware of a thought, as opposed to being lost in a thought, we experience that opening of the mind.\"\n \n \n ~Joseph Goldstein",
 "\"The only thing that is ultimately real about your journey is the step that you are taking at this moment. That’s all there ever is.\"\n \n \n ~Eckhart Tolle ",
 "\"In today’s rush, we all think too much — seek too much — want too much — and forget about the joy of just being.\"\n \n \n ~Eckhart Tolle",
 "\"What would it be like if I could accept life--accept this moment--exactly as it is?\"\n \n \n ~Tara Brach",
 ];

 int _randomNumber = Random().nextInt(11) + 0; //returning a random index number

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("5.JPG"), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Center(
          key: ValueKey("center1"),
          child: Text(
            quotesList[_randomNumber], //showing the random quote on the screen
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
             color: Colors.white,
             fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            key: ValueKey("text1"),
          ),
        ),
      ),
    );
  }
}
