import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:full_kitchen/models/category.dart';

class Receipt extends ChangeNotifier {
  String nameReceipt;
  Uint8List imageReceipt;
  List<String> ingredients;
  List<String> preparationMode;
  String moreInformation;
  Category category;

  Receipt(
    this.nameReceipt,
    this.imageReceipt,
    this.ingredients,
    this.preparationMode,
    this.moreInformation,
    this.category,
  );
}
