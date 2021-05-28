import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text('Receitas'),
        backgroundColor: Color.fromRGBO(243, 2, 10, 1),
      ),
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
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsReceitpt(newList[index]),
                  ),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateReceipt(_category),
          ),
        ),
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
