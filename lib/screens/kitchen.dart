import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_kitchen/components/navigation.dart';
import 'package:full_kitchen/screens/category_kitchen.dart';

class Kitchen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1000,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: 1000,
          color: Color.fromRGBO(34, 33, 39, 0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.height * 0.45,
                child: Text(
                  ' Bem-vinda (o) ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.height * 0.45,
                child: Text(
                  'Temos muitas variedades de receitas que você pode fazer e aprimorar os teus conhecimentos culinários. E você pode cadastrar suas receitas favoritas.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.45,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(243, 2, 10, 1),
                    ),
                    onPressed: () {
                      navigatorPush(
                        context,
                        () => CategoryKitchen(),
                      );
                    },
                    child: Text(
                      'Aproveite',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
