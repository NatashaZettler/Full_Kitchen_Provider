import 'package:flutter/material.dart';

class DetailsReceitpt extends StatefulWidget {
  @override
  _DetailsReceitptState createState() => _DetailsReceitptState();
}

class _DetailsReceitptState extends State<DetailsReceitpt> {
  List<bool> _selection = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          ),
      body: Column(
        children: [
          Container(
            child: Image.asset('assets/images/bake.jpg'),
          ),
          Text('PAVÊ'),
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
                }else if(index == 1){
                  _selection[index] = true;
                  _selection[0] = false;
                  _selection[2] = false;
                }else if(index == 2){
                  _selection[index] = true;
                  _selection[1] = false;
                  _selection[0] = false;
                }
            });
          },
          color: Colors.red,
          selectedColor: Colors.orange,
          renderBorder: false,)
        ],
      ),
    );
  }
}
