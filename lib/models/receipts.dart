import 'package:flutter/material.dart';
import 'package:full_kitchen/models/receipt.dart';

class Receipts extends ChangeNotifier{
  final List<Receipt> _receipts = [];

  List<Receipt> get receiptsList => _receipts;

  void addReceipt(Receipt newReceipt){
    this._receipts.add(newReceipt);
    notifyListeners();
  }
}