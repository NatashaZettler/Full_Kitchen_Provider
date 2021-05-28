import 'dart:io';

import 'package:flutter/material.dart';
import 'package:full_kitchen/components/bottom_sheet.dart';
import 'package:full_kitchen/components/snackbar.dart';
import 'package:full_kitchen/models/categories.dart';
import 'package:full_kitchen/models/category.dart';
import 'package:full_kitchen/utils/images/convert_image.dart';
import 'package:provider/provider.dart';

class CreateCategory extends StatefulWidget {
  @override
  _CreateCategoryState createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  final _controllerCategory = TextEditingController();

  File file = File('assets/images/bake.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre uma categoria'),
        backgroundColor: Color.fromRGBO(243, 2, 10, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: TextFormField(
                controller: _controllerCategory,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => _controllerCategory.clear(),
                    icon: Icon(Icons.clear),
                  ),
                  border: UnderlineInputBorder(),
                  labelText: 'Nome da Categoria',
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: file.isAbsolute
                  ? Image.file(file)
                  : Image.asset('assets/images/bake.jpg'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(243, 2, 10, 1),
              ),
              onPressed: () {
                showBottomSheetComponent(context).then((value) {
                  setState(() {
                    file = value;
                  });
                });
              },
              child: Text(
                'Escolha uma imagem para categoria',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(243, 2, 10, 1),
              ),
              onPressed: () async {
                if (_controllerCategory.text.isNotEmpty) {
                  var imageBytes = await convertImageToBase64(file.path);
                  Provider.of<Categories>(context, listen: false)
                      .addCategory(Category(
                    _controllerCategory.text,
                    imageBytes,
                  ));
                  Navigator.pop(context);
                } else {
                  message(context,
                      'Não esqueça, por favor, de digitar o nome da categoria');
                }
              },
              child: Text(
                'Salvar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
