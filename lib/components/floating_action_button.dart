import 'package:flutter/material.dart';
import 'package:full_kitchen/components/navigation.dart';

Widget floatingActionButton(BuildContext context, Function() goToscreen) {
  return FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () => navigatorPush(
      context,
      () => goToscreen(),
    ),
  );
}
