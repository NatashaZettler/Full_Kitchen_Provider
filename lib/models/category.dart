import 'dart:typed_data';

import 'package:flutter/material.dart';

class Category extends ChangeNotifier {
  String nameCategory;
  Uint8List imageCategory;

  Category(
    this.nameCategory,
    this.imageCategory,
  );

  void addCategory(String name, Uint8List image) {
    this.nameCategory = name;
    this.imageCategory = image;
    notifyListeners();
  }
}
