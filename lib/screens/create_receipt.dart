import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_kitchen/components/bottom_sheet.dart';
import 'package:full_kitchen/components/snackbar.dart';
import 'package:full_kitchen/models/category.dart';
import 'package:full_kitchen/models/receipt.dart';
import 'package:full_kitchen/models/receipts.dart';
import 'package:full_kitchen/utils/images/convert_image.dart';
import 'package:provider/provider.dart';

class CreateReceipt extends StatefulWidget {
  final Category _category;
  CreateReceipt(this._category);

  @override
  _CreateReceiptState createState() => _CreateReceiptState();
}

class _CreateReceiptState extends State<CreateReceipt> {
  final List<TextEditingController> _controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  File file = File('assets/images/pasta.jpg');
  final List<String> _ingredientsList = [];
  final List<String> _preparationMode = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre uma categoria'),
        backgroundColor: Color.fromRGBO(243, 2, 10, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left:15,right: 15),
        child: Container(
          height: 900,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  controller: _controller[0],
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => _controller[0].clear(),
                      icon: Icon(Icons.clear),
                    ),
                    border: UnderlineInputBorder(),
                    labelText: 'Nome da receita',
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.32,
                child: file.isAbsolute
                    ? Image.file(file)
                    : Image.asset('assets/images/pasta.jpg'),
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
                child: Text('Escolha uma imagem para receita'),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                controller: _controller[1],
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _ingredientsList.add(_controller[1].text);
                        _controller[1].clear();
                      });
                    },
                    icon: Icon(Icons.add),
                  ),
                  border: UnderlineInputBorder(),
                  labelText: 'Nome do ingrediente',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lista de ingredientes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _ingredientsList.length,
                    itemBuilder: (context, index) {
                      return Text(_ingredientsList[index]);
                    }),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                controller: _controller[2],
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _preparationMode.add(_controller[2].text);
                        _controller[2].clear();
                      });
                    },
                    icon: Icon(Icons.add),
                  ),
                  border: UnderlineInputBorder(),
                  labelText: 'Passos do preparo',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Modo de preparo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _preparationMode.length,
                    itemBuilder: (context, index) {
                      return Text(_preparationMode[index]);
                    }),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                controller: _controller[3],
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => _controller[3].clear(),
                    icon: Icon(Icons.clear),
                  ),
                  border: UnderlineInputBorder(),
                  labelText: '+ informações',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(243, 2, 10, 1),
                  ),
                  onPressed: () async {
                    if (_controller[0].text.isNotEmpty ||
                        _controller[3].text.isNotEmpty ||
                        _ingredientsList.length == 0 ||
                        _preparationMode.length == 0) {
                      var imageBytes = await convertImageToBase64(file.path);
                      Provider.of<Receipts>(context, listen: false)
                          .addReceipt(Receipt(
                        _controller[0].text,
                        imageBytes,
                        _ingredientsList,
                        _preparationMode,
                        _controller[3].text,
                        widget._category,
                      ));
                      Navigator.pop(context);
                    } else {
                      message(context,
                          'Não esqueça de preencher todas as informações, por favor. ');
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
