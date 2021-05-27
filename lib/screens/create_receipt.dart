import 'dart:io';

import 'package:flutter/material.dart';
import 'package:full_kitchen/components/bottom_sheet.dart';
import 'package:full_kitchen/models/receipt.dart';
import 'package:full_kitchen/models/receipts.dart';
import 'package:full_kitchen/utils/images/convert_image.dart';
import 'package:provider/provider.dart';

class CreateReceipt extends StatefulWidget {
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

  File file = File('');
  final List<String> _ingredientsList = [];
  final List<String> _preparationMode = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Cadastre uma receita'),
          TextFormField(
            controller: _controller[0],
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nome da receita',
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0),
            child: SizedBox(
                height: 30,
                width: 30,
                child: Image.file(file)),
          ),
          ElevatedButton(
            onPressed: () {
              showBottomSheetComponent(context).then((value) {
                setState(() {
                  file = value;
                });
              });
            },
            child: Text('Escolha da receita'),
          ),
          TextFormField(
            controller: _controller[1],
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nome do ingrediente',
            ),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              _ingredientsList.add(_controller[1].text);
              _controller[1].clear();
            });

          }, child: Text('Inserir'),),
          Text('Lista de ingredientes'),
          Expanded(
            child: ListView.builder(
                itemCount: _ingredientsList.length,
                itemBuilder: (context, index) {
                  return Text(_ingredientsList[index]);
                }),
          ),

          TextFormField(
            controller: _controller[2],
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Passos do preparo',
            ),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              _preparationMode.add(_controller[2].text);
              _controller[2].clear();
            });

          }, child: Text('Inserir'),),
          Text('Modo de preparo'),
          Expanded(
            child: ListView.builder(
                itemCount: _preparationMode.length,
                itemBuilder: (context, index) {
                  return Text(_preparationMode[index]);
                }),
          ),

          // TextFormField(
          //   controller: _controller[3],
          //   decoration: InputDecoration(
          //     border: UnderlineInputBorder(),
          //     labelText: '+ informações',
          //   ),
          // ),
          ElevatedButton(
            onPressed: () async {
              var imageBytes = await convertImageToBase64(file.path);
              Provider.of<Receipts>(context, listen: false).addReceipt(Receipt(
                _controller[0].text,
                imageBytes,
                _ingredientsList,
                _preparationMode,
                _controller[3].text,
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
