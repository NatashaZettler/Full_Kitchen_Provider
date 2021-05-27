import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ReturnImage {
  final picker = ImagePicker();
  late File _image;

  Future<File> getImage(ImageSource item) async {

    final pickedFile = await picker.getImage(source: item);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }

    return _image;
  }
}
