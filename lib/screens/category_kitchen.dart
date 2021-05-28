import 'package:flutter/material.dart';
import 'package:full_kitchen/components/app_bar.dart';
import 'package:full_kitchen/components/floating_action_button.dart';
import 'package:full_kitchen/components/navigation.dart';
import 'package:full_kitchen/models/categories.dart';
import 'package:full_kitchen/screens/create_category.dart';
import 'package:full_kitchen/screens/receipts_list.dart';
import 'package:provider/provider.dart';

class CategoryKitchen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Categorias'),
      body: Consumer<Categories>(builder: (context, categories, child) {
        return GridView.builder(
            itemCount: categories.categoriesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              //childAspectRatio: 1.5,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GridTile(
                footer: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 10,
                  child: Center(
                    child: Text(
                      categories.categoriesList[index].nameCategory,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        backgroundColor: Color.fromRGBO(34, 33, 39, 0.7),
                      ),
                    ),
                  ),
                ),
                child: InkWell(
                  child: Card(
                    child: Image.memory(
                      categories.categoriesList[index].imageCategory,
                      // scale: 9.5,
                    ),
                  ),
                  onTap: () => navigatorPush(
                    context,
                    () => ReceiptsList(categories.categoriesList[index]),
                  ),
                ),
              );
            });
      }),
      floatingActionButton: floatingActionButton(
        context,
        () => CreateCategory(),
      ),
    );
  }
}
