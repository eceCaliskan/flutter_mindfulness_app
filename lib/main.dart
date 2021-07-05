import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/ui/authorize.dart';

void main() async {
  //main function to internilize the firebase and call the app class
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Authorize(email: null)); //


}




