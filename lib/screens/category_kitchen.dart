import 'package:flutter/material.dart';
import 'package:full_kitchen/models/category.dart';
import 'package:full_kitchen/models/receipt.dart';
import 'package:full_kitchen/models/receipts.dart';
import 'package:full_kitchen/screens/receipts_list.dart';

class CategoryKitchen extends StatelessWidget {
  List<Category> _category = [
    Category(
      'Doces',
      'assets/images/bake.jpg',
      Receipts(
        Receipt(
            'PAVÊ DE MORANGO',
            [
              '1 pacote de bolacha maizena ou bolacha champagne',
              '1 lata de leite condensado',
              '1 caixinha de creme de leite',
            ],
            [
              'Em uma panela, coloque o leite condensado, o leite (reserve um pouco para dissolver o trigo), as gemas peneiradas levemente batidas, a baunilha e a farinha misturada no leite reservado.',
              'Mexa até engrossar (engrossou em 15 minutinhos, mas não pode parar de mexer).',
              'Desligue o fogo e junte o creme de leite com o soro.',
            ],
            'O pavê, receita brasileira com inspiração francesa, é pra comer com a boca e com os olhos, né? Muito famoso e amado nos lares do Brasil, é uma receita simples e prática, mas muito saborosa.'),
      ),
    ),
    Category(
      'Chás',
      'assets/images/tie.jpg',
      Receipts(
        Receipt(
            'CHÁ CALMANTE E RELAXANTE',
            [
              '1 sache para chá de maracujá',
              '1 sachê para chá de camomila',
              '1 sachê para chá de hortelã',
              '250 ml de água fervente',
            ],
            [
              'Ferva a água.',
              'Desligue o fogo e acrescente os sachês.',
              'Deixe em infusão por 10 minutos.',
            ],
            'Aproveite!'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: _category.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemBuilder: (context, index) {
            return GridTile(
                footer: Center(child: Text(_category[index].nameCategory)),
                child: InkWell(
                  child: Card(
                    child: Image.asset(_category[index].imageCategory),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReceiptsList(),
                    ),
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
