import 'package:flutter/material.dart';

class CategoryKitchen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2

      ), itemBuilder: (context, index){
        return Text('ERRR');
      }),
    );
  }
}