import 'package:flutter/material.dart';
import 'package:full_kitchen/screens/details_receipt.dart';

class ReceiptsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipts'),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return ListTile(
            title: Text('PAVÊ DE MORANGO',),
            leading: Image.asset('assets/images/bake.jpg'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsReceitpt(),
              ),
            ),);
          }),
    );
  }
}
