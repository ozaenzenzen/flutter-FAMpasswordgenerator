import 'package:flutter/material.dart';
import 'package:flutter_fam_passwordgenerator/view/home.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FAM Password Generator",
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}