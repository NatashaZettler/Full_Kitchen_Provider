import 'package:flutter/material.dart';
import 'package:full_kitchen/models/receipt.dart';

class Receipts extends ChangeNotifier{
  final Receipt receipt;

  Receipts(this.receipt);
}