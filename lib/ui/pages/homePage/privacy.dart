import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

//This class includes the part of the privacy agreement
//
//

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF8CADCA),
        appBar: AppBar(
          title: Text(
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
            child: Column(children: [
              Image.asset('1.JPG',
                  height: MediaQuery.of(context).size.height / 4),
              new Expanded(
                flex: 1,
                child: new SingleChildScrollView(
                  scrollDirection: Axis.vertical, //.horizontal
                  child: new Text(
                    "\n \nWe are committed to protecting your personal information and your right to privacy. If you have any questions or concerns about this privacy notice, or our practices with regards to your personal information, please contact us at ece.caliskan2222@gmail.com" +
                        "\n \nWhen you use our mobile application, as the case may be and more generally, use any of our services (the Services, which include the App), we appreciate that you are trusting us with your personal information. We take your privacy very seriously. In this privacy notice, we seek to explain to you in the clearest way possible what information we collect, how we use it and what rights you have in relation to it. We hope you take some time to read through it carefully, as it is important. If there are any terms in this privacy notice that you do not agree with, please discontinue use of our Services immediately." +
                        "\n \nThis privacy notice applies to all information collected through our Services (which, as described above, includes our App), as well as, any related services, sales, marketing or events." +
                        "\n \nPlease read this privacy notice carefully as it will help you understand what we do with the information that we collect."
                            "\n \n Personal information you disclose to us" +
                        "  In Short: We collect personal information that you provide to us." +
                        " We collect personal information that you voluntarily provide to us when you register on the App, express an interest in obtaining information about us or our products and Services, when you participate in activities on the App or otherwise when you contact us." +
                        "The personal information that we collect depends on the context of your interactions with us and the App, the choices you make and the products and features you use. The personal information we collect may include the following:" +
                        "Personal Information Provided by You. We collect email addresses; passwords; and other similar information." +
                        " All personal information that you provide to us must be true, complete and accurate, and you must notify us of any changes to such personal information." +
                        "Information automatically collected",
                    style: new TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
