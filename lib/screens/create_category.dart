import 'dart:io';

import 'package:flutter/material.dart';
import 'package:full_kitchen/components/bottom_sheet.dart';
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

  File file = File('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Cadastre uma categoria'),
          TextFormField(
            controller: _controllerCategory,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nome da Categoria',
            ),
          ),
          Container(
            child: Image.file(file),
          ),
          ElevatedButton(
            onPressed: () {
              showBottomSheetComponent(context).then((value) {
                setState(() {
                  file = value;
                });
              });
            },
            child: Text('Escolha a imagem da categoria'),
          ),
          ElevatedButton(
            onPressed: () async {
              var imageBytes = await convertImageToBase64(file.path);
              Provider.of<Categories>(context, listen: false)
                  .addCategory(Category(
                _controllerCategory.text,
                imageBytes,
              ));
              Navigator.pop(context);
            },
            child: Text('Salvar'),
          ),
        ],
      ),
    );
  }
}