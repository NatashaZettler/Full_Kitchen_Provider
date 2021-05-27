import 'package:flutter/material.dart';
import 'package:full_kitchen/models/receipt.dart';

class DetailsReceitpt extends StatefulWidget {
  final Receipt receipt;
  DetailsReceitpt(this.receipt);

  @override
  _DetailsReceitptState createState() => _DetailsReceitptState();
}

class _DetailsReceitptState extends State<DetailsReceitpt> {
  List<bool> _selection = List.generate(3, (_) => false);
  String text = 'HD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          ),
      body: Column(
        children: [
          Container(
            child: Image.memory(widget.receipt.imageReceipt),
          ),
          Text(widget.receipt.nameReceipt),
          ToggleButtons(children: [
            Text('Ingredientes'),
            Text('Modo de preparo'),
            Text('+ Informações'),
          ], isSelected: _selection,
          onPressed: (index){
            setState(() {
                if(index == 0){
                  _selection[index] = true;
                  _selection[1] = false;
                  _selection[2] = false;
                  this.text = widget.receipt.ingredients.toString();
                }else if(index == 1){
                  _selection[index] = true;
                  _selection[0] = false;
                  _selection[2] = false;
                  this.text = widget.receipt.preparationMode.toString();
                }else if(index == 2){
                  _selection[index] = true;
                  _selection[1] = false;
                  _selection[0] = false;
                  this.text = widget.receipt.moreInformation;
                }
            });
          },
          color: Colors.red,
          selectedColor: Colors.orange,
          renderBorder: false,),
        Text(text),
        ],
      ),
    );
  }
}
