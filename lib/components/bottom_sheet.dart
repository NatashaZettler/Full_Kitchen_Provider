import 'dart:io';

import 'package:flutter/material.dart';
import 'package:full_kitchen/utils/images/return_image.dart';
import 'package:image_picker/image_picker.dart';

Future<File> showBottomSheetComponent(context) async {
  final ReturnImage _image = ReturnImage();
  File _file = File('');

  await showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                  leading: new Icon(Icons.camera_alt),
                  title: new Text('Câmera'),
                  onTap: () async {
                    _file = await _image.getImage(ImageSource.camera);
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: new Icon(Icons.insert_photo_rounded),
                  title: new Text('Galeria'),
                  onTap: () async {
                    _file = await _image.getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  }),
            ],
          ),
        );
      });
  return _file;
}
