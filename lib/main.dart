import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:full_kitchen/models/categories.dart';
import 'package:full_kitchen/models/category.dart';
import 'package:full_kitchen/models/receipt.dart';
import 'package:full_kitchen/models/receipts.dart';
import 'package:full_kitchen/screens/kitchen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Categories()),
      ChangeNotifierProvider(
          create: (context) => Receipts(
                Receipt('', [], [], ''),
              )),
    ],
    child: MyKitchen(),
  ));
}

class MyKitchen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Full Kitchen',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Kitchen());
  }
}
