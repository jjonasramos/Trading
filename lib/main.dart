import 'package:flutter/material.dart';
import 'package:trading/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Login(),
    );
  }
}