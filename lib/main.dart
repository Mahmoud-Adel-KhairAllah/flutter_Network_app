import 'package:flutter/material.dart';
import 'package:network_flutter_app/screens/mainScreen.dart';
import 'package:get/get.dart' ;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:MainScreen());  }


}

  