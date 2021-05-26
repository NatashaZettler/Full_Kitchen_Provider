import 'package:flutter/material.dart';

class CategoryKitchen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 2,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemBuilder: (context, index) {
            return GridTile(
                footer: Center(child: Text('Bake')),
                child: InkWell(
              child: Card(
                child: Image.asset('assets/images/bake.jpg'),
              ),
              onTap: (){
                
              },
            ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
      ),
    );
  }
}
