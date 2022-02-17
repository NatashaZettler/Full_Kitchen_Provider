import 'package:flutter/material.dart';
import 'package:full_kitchen/components/app_bar.dart';
import 'package:full_kitchen/models/receipt.dart';

class DetailsReceitpt extends StatefulWidget {
  final Receipt receipt;

  DetailsReceitpt(this.receipt);

  @override
  _DetailsReceitptState createState() => _DetailsReceitptState();
}

class _DetailsReceitptState extends State<DetailsReceitpt> {
  List<bool> _selection = List.generate(3, (_) => false);
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.receipt.nameReceipt),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Card(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.height * 0.9,
                  child: Image.memory(widget.receipt.imageReceipt),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ToggleButtons(
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 36) / 3,
                    child: Text(
                      'Ingredientes',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 36) / 3,
                    child: Text(
                      ' Modo de Preparo ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 36) / 3,
                    child: Text(
                      '+ Informações',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                isSelected: _selection,
                onPressed: (index) {
                  setState(() {
                    if (index == 0) {
                      _selection[index] = true;
                      _selection[1] = false;
                      _selection[2] = false;
                      this.text = getIngredients(widget.receipt.ingredients);
                    } else if (index == 1) {
                      _selection[index] = true;
                      _selection[0] = false;
                      _selection[2] = false;
                      this.text =
                          getPreparationMode(widget.receipt.preparationMode);
                    } else if (index == 2) {
                      _selection[index] = true;
                      _selection[1] = false;
                      _selection[0] = false;
                      this.text = widget.receipt.moreInformation;
                    }
                  });
                },
                color: Color.fromRGBO(243, 2, 10, 1),
                selectedColor: Colors.white,
                fillColor: Colors.red,
                //renderBorder: false,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Container(
                height: 300,
                padding: EdgeInsets.only(top: 50),
                child: Card(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        text,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )),
                )),
          ],
        ),
      ),
    );
  }

  String getIngredients(List<String> ingredients) {
    return ingredients.reduce((value, element) => '$value \n $element');
  }

  String getPreparationMode(List<String> preparationMode) {
    String value = '';
    for (int i = 0; i < preparationMode.length; i++) {
      value = '${preparationMode[i]}\n$value';
    }
    return value;
  }
}
