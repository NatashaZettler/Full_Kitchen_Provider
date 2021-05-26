import 'package:flutter/material.dart';
import 'package:full_kitchen/screens/kitchen.dart';

void main() {
  runApp(MyKitchen());
}

class MyKitchen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Full Kitchen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Kitchen());
  }
}
