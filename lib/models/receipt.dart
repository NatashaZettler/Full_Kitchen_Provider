import 'package:flutter/cupertino.dart';

class Receipt extends ChangeNotifier {
  final String name;
  final List<String> ingredients;
  final List<String> preparationMode;
  final String moreInformation;

  Receipt(
    this.name,
    this.ingredients,
    this.preparationMode,
    this.moreInformation,
  );
}
