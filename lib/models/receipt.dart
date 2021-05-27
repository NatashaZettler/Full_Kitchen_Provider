import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class Receipt extends ChangeNotifier {
  String nameReceipt;
  Uint8List imageReceipt;
  List<String> ingredients;
  List<String> preparationMode;
  String moreInformation;

  Receipt(
    this.nameReceipt,
    this.imageReceipt,
    this.ingredients,
    this.preparationMode,
    this.moreInformation,
  );

  void addReceipt(
    String name,
    Uint8List image,
    List<String> ingredients,
    List<String> preparationMode,
    String moreInformation,
  ) {
    this.nameReceipt = name;
    this.imageReceipt = image;
    this.ingredients = ingredients;
    this.preparationMode = preparationMode;
    this.moreInformation = moreInformation;
    notifyListeners();
  }
}
