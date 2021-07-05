// Imports the Flutter Driver API.

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Sign in feature to pages of the ', () {

     //login fields and button
    final addemailfield = find.byValueKey("emailfield1");
    final addpasswordfield = find.byValueKey("passwordfield1");
    final addloginbutton = find.byValueKey("submitloginbutton1");

    //sign-up fields and button
    final addusernamefield1 = find.byValueKey("usernamefield");
    final addemailfield1 = find.byValueKey("emailfield");
    final addpasswordfield1 = find.byValueKey("passwordfield");
    final addregisterbutton1 = find.byValueKey("registerbutton");


    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });



   test('integration tester sign into the app with details ttt@ttt.ttt and ttttttttt111', () async {
         //enter details
          await driver.tap(addemailfield);
          await driver.enterText("ttt@ttt.ttt");
          await driver.tap(addpasswordfield);
          await driver.enterText("ttttttttt111");
          //submit
          await driver.tap(addloginbutton);
          //expect homepage
          await driver.waitFor(find.text("Feel"));

       });

       test('integration tester sign up to the app with details ccc, cccc@cccc.cccc, ccccccc111', () async {
      // sign-up details.
          await driver.tap(addusernamefield1);
          await driver.enterText("ccc");
          await driver.tap(addemailfield1);
          await driver.enterText("cccc@cccc.cccc");
          await driver.tap(addpasswordfield1);
          await driver.enterText("ccccccc111");
          //submit the details
          await driver.tap(addregisterbutton1);
        //expect home page
          await driver.waitFor(find.text("Feel"));
    });

    test('click on the mindfulness bottom navigation tab', () async {
      await driver.waitFor(find.byValueKey("bottomnavigation"));
      await driver.tap(find.text('Mindfulness'));
      await driver.waitFor(find.text("Swipe"));
    });

    test('Open meditation page, play the meditation timer and stop', () async {

           await driver.tap(find.text('Meditation'));
           await new Future.delayed(const Duration(seconds: 5));
           //start meditation
           await driver.tap(find.byValueKey("playicon"));
           await new Future.delayed(const Duration(seconds: 5));
           await driver.tap(find.byValueKey("stopicon"));
      });

    test('click on the journaling bottom navigation tab insert answers to text input fields', () async {
      //click the journaling tab
      await driver.tap(find.text('Journaling'));
      await new Future.delayed(const Duration(seconds: 10));
      await driver.tap(find.text('Journaling'));
      await new Future.delayed(const Duration(seconds: 10));
      //insert answers
      await driver.tap(find.byValueKey("question1"));
      await driver.enterText("first answer");
      await driver.tap(find.byValueKey("question2"));
      await driver.enterText("second answer");
      await driver.tap(find.byValueKey("question3"));
      await driver.enterText("third answer");
      //save answers to database
      await driver.tap(find.byValueKey("buttonsave"));
    });
  });



}
