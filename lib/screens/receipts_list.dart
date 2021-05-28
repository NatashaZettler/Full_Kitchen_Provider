import 'package:flutter/material.dart';
import 'package:full_kitchen/components/app_bar.dart';
import 'package:full_kitchen/components/floating_action_button.dart';
import 'package:full_kitchen/components/navigation.dart';
import 'package:full_kitchen/models/category.dart';
import 'package:full_kitchen/models/receipt.dart';
import 'package:full_kitchen/models/receipts.dart';
import 'package:full_kitchen/screens/create_receipt.dart';
import 'package:full_kitchen/screens/details_receipt.dart';
import 'package:provider/provider.dart';

class ReceiptsList extends StatelessWidget {
  final Category _category;

  ReceiptsList(this._category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Receitas'),
      body: Consumer<Receipts>(builder: (context, receipts, child) {
        final List<Receipt> newList =
            findAllReceiptThisCategory(receipts.receiptsList);
        return ListView.builder(
            itemCount: newList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  newList[index].nameReceipt,
                ),
                leading: Image.memory(newList[index].imageReceipt),
                onTap: () => navigatorPush(
                  context,
                  () => DetailsReceitpt(newList[index]),
                ),
              );
            });
      }),
      floatingActionButton: floatingActionButton(
        context,
        () => CreateReceipt(_category),
      ),
    );
  }

  List<Receipt> findAllReceiptThisCategory(List<Receipt> receiptsList) {
    List<Receipt> list = [];
    receiptsList.forEach((element) {
      if (element.category.nameCategory == _category.nameCategory) {
        list.add(element);
      }
    });
    return list;
  }
}
