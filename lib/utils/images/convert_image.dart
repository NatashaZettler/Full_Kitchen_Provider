import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

Future<Uint8List> convertImageToBase64(String image) async {
  final bytes = await File(image).readAsBytes();
  return bytes;
}

Image convertBase64ToImage(String base64) {
  return Image.memory(base64Decode(base64));
}
