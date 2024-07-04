import 'package:flutter/material.dart';
import 'Quran api.dart';
import 'complexjson.dart';
import 'example3.dart';
import 'exampletwo.dart';
import 'homescreen.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Complexjson(),
    );
  }
}
