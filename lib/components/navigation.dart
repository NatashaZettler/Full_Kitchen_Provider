import 'package:flutter/material.dart';

void navigatorPush(BuildContext context, Function() goToScreen) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => goToScreen(),
      ));
}
