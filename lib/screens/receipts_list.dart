import 'package:flutter/material.dart';
import 'package:full_kitchen/models/receipts.dart';
import 'package:full_kitchen/screens/create_receipt.dart';
import 'package:full_kitchen/screens/details_receipt.dart';
import 'package:provider/provider.dart';

class ReceiptsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipts'),
      ),
      body: Consumer<Receipts>(builder: (context, receipts, child) {
        return ListView.builder(
            itemCount: receipts.receiptsList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  receipts.receiptsList[index].nameReceipt,
                ),
                leading: Image.memory(receipts.receiptsList[index].imageReceipt),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsReceitpt(),
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
            builder: (context) => CreateReceipt(),
          ),
        ),
      ),
    );
  }
}
