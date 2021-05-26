import 'package:flutter/material.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Bem-vinda(o)',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryKitchen(),
                      ));
                },
                child: Text('Aproveite'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
