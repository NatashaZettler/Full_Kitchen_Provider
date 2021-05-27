import 'package:flutter/material.dart';
import 'package:full_kitchen/models/categories.dart';
import 'package:full_kitchen/screens/create_category.dart';
import 'package:full_kitchen/screens/receipts_list.dart';
import 'package:provider/provider.dart';

class CategoryKitchen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Categories>(builder: (context, categories, child) {
        return GridView.builder(
            itemCount: categories.categoriesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
            itemBuilder: (context, index) {
              return GridTile(
                  footer: Center(
                      child:
                          Text(categories.categoriesList[index].nameCategory)),
                  child: InkWell(
                    child: Card(
                      child: Image.memory(
                          categories.categoriesList[index].imageCategory),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReceiptsList(),
                      ),
                    ),
                  ));
            });
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateCategory(),
          ),
        ),
      ),
    );
  }
}
