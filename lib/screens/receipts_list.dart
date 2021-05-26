import 'package:flutter/material.dart';

class ReceitpsList extends StatelessWidget {
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
            leading: Image.asset('assets/images/bake.jpg'),);
          }),
    );
  }
}
