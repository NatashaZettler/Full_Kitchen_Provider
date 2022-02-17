import 'package:flutter/material.dart';
import 'package:full_kitchen/models/category.dart';

class Categories extends ChangeNotifier {
  final List<Category> _categories = [];

  List<Category> get categoriesList => _categories;

  void addCategory(Category newCategory) {
    this._categories.add(newCategory);
    notifyListeners();
  }
}
